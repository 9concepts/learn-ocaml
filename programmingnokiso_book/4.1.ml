let jikyu year = 850 + (100 * year)

(* let baito_kyuyo year hours_in_month = hours_in_month * jikyu year;; *)
let baito_kyuyo year hours_in_month = jikyu year * hours_in_month;;

baito_kyuyo 1 10
