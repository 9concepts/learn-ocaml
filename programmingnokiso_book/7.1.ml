(* 国語、数学、英語、理科、社会の点数を与えられたら、合計点と平均点を組で返す *)
(* goukei_to_heikin : -> int -> int -> int -> int -> int -> int * int *)
let goukei_to_heikin japanese math english science social =
  let total = japanese + math + english + science + social in
  (total, total / 5)

(* テスト *)
let test = goukei_to_heikin 10 10 10 10 10 = (50, 10)
