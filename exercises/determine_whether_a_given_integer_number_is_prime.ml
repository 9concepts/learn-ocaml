let is_prime n =
  let rec not_div i =
    if i * i <= n then n mod i <> 0 && not_div (i + 1) else n >= 2
  in
  not_div 2

(* let is_prime n =
   let n = abs n in
   let rec is_not_divisor d =
     d * d > n || (n mod d <> 0 && is_not_divisor (d + 1))
   in
   n <> 1 && is_not_divisor 2 *)

let test1 = not (is_prime 1)
let test2 = is_prime 7
let test3 = not (is_prime 12)
let test4 = not (is_prime 57)
let test5 = is_prime 17
let test6 = not (is_prime 111)
