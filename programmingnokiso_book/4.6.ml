(* 鶴の数 x がもつ合計の足の本数を返す *)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi x = x * 2

(* テスト *)
let test1 = tsuru_no_ashi 2 = 4
let test2 = tsuru_no_ashi 0 = 0
let test3 = tsuru_no_ashi 1 = 2

(* 亀の数 x がもつ合計の足の本数を返す *)
(* kame_no_ashi : int -> int *)
let kame_no_ashi x = x * 4

(* テスト *)
let test1 = kame_no_ashi 2 = 8
let test2 = kame_no_ashi 0 = 0
let test3 = kame_no_ashi 1 = 4
