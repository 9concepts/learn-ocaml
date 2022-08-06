type 'a node = One of 'a | Many of 'a node list

(* my solution *)
(* flatten : 'a node list -> 'a list *)
let rec flatten list =
  match list with
  | [] -> []
  | h :: t ->
      (match h with
      | One x -> [ x ]
      | Many l -> flatten l)
      @ flatten t

(* solution *)
let flatten list =
  let rec aux acc = function
    | [] -> acc
    | One x :: t -> aux (x :: acc) t
    | Many l :: t -> aux (aux acc l) t
  in
  List.rev (aux [] list)

let test1 =
  flatten [ One "a"; Many [ One "b"; Many [ One "c"; One "d" ]; One "e" ] ]
  = [ "a"; "b"; "c"; "d"; "e" ]
