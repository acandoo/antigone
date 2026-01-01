-module(mutable_ffi).

-export([mutable_from/1, mutable_get/1, mutable_set/2]).

mutable_from(Value) ->
  Pid = spawn(fun() -> mutable_loop(Value) end),
  {mutable, Pid}.

mutable_get({mutable, Pid}) ->
  Pid ! {get, self()},
  receive
    {value, Value} -> Value
  end.

mutable_set({mutable, Pid}, NewValue) ->
  Pid ! {set, NewValue},
  nil.

%% Internal loop that holds the mutable state
mutable_loop(Value) ->
  receive
    {get, ReplyPid} ->
      ReplyPid ! {value, Value},
      mutable_loop(Value);
    {set, NewValue} ->
      mutable_loop(NewValue)
  end.