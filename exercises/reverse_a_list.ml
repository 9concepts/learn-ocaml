(* Reverse a list *)
(* rev : 'a list -> 'a list *)
(* solution *)
let rec rev list =
  let rec aux acc = function
    | [] -> acc
    | h :: t -> aux (h :: acc) t
  in
  aux [] list
(* my solution *)
(* let rec rev = function
   | [] -> []
   | first :: rest -> rest @ [ first ] *)

let test_rev0 = rev [ 1; 2 ] = [ 2; 1 ]
let test_rev1 = rev [ "a"; "b" ] = [ "b"; "a" ]
let test_rev2 = rev [] = []
