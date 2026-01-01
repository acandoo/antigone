import antigone/mutable

pub fn mutable_test() {
  let initial = 0
  let #(val, _) = mutable.tuple_from(initial)
  assert val() == initial
    as "value initializes to the right value: mutable.tuple_from"

  let initial2 = 1
  let mut_val = mutable.from(initial2)
  assert mutable.get(mut_val) == initial2
    as "value initializes to the right value: mutable.from"
}

pub fn mutable_identity_test() {
  let mut_1 = mutable.from(0)
  let mut_2 = mutable.from(0)
  assert mut_1 != mut_2 as "mutables have separate identities"
}
