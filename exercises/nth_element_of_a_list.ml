List.nth [ "a"; "b"; "c"; "d"; "e" ] 2

(* List.nth [ "a" ] 2 *)
(* Exception: Failure "nth". *)

(* List length *)
(* length : 'a list -> int *)
let rec length list =
  match list with
  | [] -> 0
  | _ :: t -> 1 + length t

(* test *)
let length_test1 = length [ 1; 2; 3; 4 ] = 4
let length_test2 = length [] = 0

(* Find the N'th element of the list *)
(* nth : 'a list -> int -> 'a *)

exception Failure

let rec nth list index =
  if index < 0 || length list <= index then raise Failure
  else
    match list with
    | [] -> raise Failure
    | h :: t -> if index = 0 then h else nth t (index - 1)

let nth_test1 = nth [ "a"; "b"; "c"; "d"; "e" ] 2 = "c"
let nth_test2 = nth [ "a"; "b" ] 1 = "b"
(* nth [] 0;;
   nth [ "a" ] 100 *)
