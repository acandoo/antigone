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
