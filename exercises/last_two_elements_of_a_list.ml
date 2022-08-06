(* リストの最後の要素2つを組で返す *)
(* last_two : 'a list -> ('a * 'a) option *)
let rec last_two lst =
  match lst with
  | [] | [ _ ] -> None
  | [ first; second ] -> Some (first, second)
  | _ :: t -> last_two t
(* let rec last_two lst =
   match lst with
   | [] -> None
   | [ first ] -> None
   | [ first; second ] -> Some (first, second)
   | h :: t -> last_two t *)

(* test *)
let test1 = last_two [] = None
let test2 = last_two [ 1 ] = None
let test3 = last_two [ "a"; "b" ] = Some ("a", "b")
let test4 = last_two [ 1; 2; 3; 4 ] = Some (3, 4)
