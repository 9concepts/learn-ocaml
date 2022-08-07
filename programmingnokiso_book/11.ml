(* 階乗 *)
let rec fact n = if n = 0 then 1 else fact (n - 1) * n
let test_fact1 = fact 0 = 1
let test_fact2 = fact 1 = 1
let test_fact3 = fact 2 = 2
let test_fact4 = fact 7 = 5040
