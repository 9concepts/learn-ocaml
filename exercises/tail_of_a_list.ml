(* リストの最後の要素を返す *)
(* last : 'a list -> 'a option *)
(* let rec last lst =
   match lst with
   | [] -> None
   | first :: rest -> if rest = [] then Some first else last rest *)
let rec last lst =
  match lst with
  | [] -> None
  | [ tail ] -> Some tail
  | _ :: rest -> last rest

(* test *)

let test1 = last [ 1; 23; 4 ] = Some 4
let test1 = last [] = None
