(* 名前と成績の組を受け取り、評価を返す *)
(* seiseki : string * string -> string *)
let seiseki pair =
  match pair with name, grade -> name ^ "さんの評価は" ^ grade ^ "です"

(* テスト *)
let test = seiseki ("9sako6", "SSSSSS") = "9sako6さんの評価はSSSSSSです"
