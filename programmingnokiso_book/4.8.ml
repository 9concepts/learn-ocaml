(* 鶴と亀の数の合計 x と足の数の合計 y から鶴の数を求める *)
(* tsurukame : int -> int -> int *)
let tsurukame x y = ((4 * x) - y) / 2

(* テスト *)
let test1 = tsurukame 4 12 = 2
let test2 = tsurukame 1 2 = 1
let test2 = tsurukame 1 4 = 0
