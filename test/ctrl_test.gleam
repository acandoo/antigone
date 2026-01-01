import antigone/ctrl
import antigone/mutable

pub fn repeat_test() {
  let #(counter, set_counter) = mutable.tuple_from(0)
  {
    use <- ctrl.repeat(5)
    set_counter(counter() + 1)
  }
  assert counter() == 5
}

pub fn repeat_zero_test() {
  let #(counter, set_counter) = mutable.tuple_from(0)
  {
    use <- ctrl.repeat(0)
    set_counter(counter() + 1)
    panic
  }
  assert counter() == 0
}

pub fn repeat_negative_test() {
  let #(counter, set_counter) = mutable.tuple_from(0)
  {
    use <- ctrl.repeat(-5)
    set_counter(counter() + 1)
  }
  assert counter() == 0
}

pub fn for_test() {
  let #(counter, set_counter) = mutable.tuple_from(0)
  {
    use _ <- ctrl.for(i: 0, cond: fn(i) { i < 5 }, change: fn(i) { i + 1 })
    set_counter(counter() + 1)
    Ok(Nil)
  }
  assert counter() == 5 as "for loops the right number of times"
}

pub fn for_zero_test() {
  let #(counter, set_counter) = mutable.tuple_from(0)
  {
    use _ <- ctrl.for(i: 0, cond: fn(i) { i < 0 }, change: fn(i) { i + 1 })
    set_counter(counter() + 1)
    Ok(Nil)
  }
  assert counter() == 0 as "for loops 0 times"
}
// i dont feel like making more tests this is trivial enough anyways
