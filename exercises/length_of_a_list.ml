(* List length *)
(* length : 'a list -> int *)
(* let rec length list =
   match list with
   | [] -> 0
   | _ :: t -> 1 + length t *)

(* test *)
(* let length_test1 = length [ 1; 2; 3; 4 ] = 4
   let length_test2 = length [] = 0 *)

(* List length 末尾再帰 ver *)
(* length : 'a list -> int *)

let length =
  let rec length_tail_call current_length list =
    match list with
    | [] -> current_length
    | _ :: t -> length_tail_call (1 + current_length) t
  in
  length_tail_call 0

(* test *)
let length_test3 = length [ 1; 2; 3; 4 ] = 4
let length_test4 = length [] = 0

(* 末尾呼び出し *)
(* function f() { return g() } *)
(* 末尾再帰 *)
(* function f() { return f() } *)
