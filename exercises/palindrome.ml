(* my solution *)
let palindrome list =
  let rec reverse = function
    | [] -> []
    | h :: t -> reverse t @ [ h ]
  in
  list = reverse list

(* solution *)
(* let palindrome list = List.rev list = list *)
let test1 = palindrome [ 1; 2; 3 ] = false
let test2 = palindrome [ "a" ] = true
let test3 = palindrome [ "a"; "a" ] = true
let test4 = palindrome [ "a"; "b"; "a" ] = true
let test5 = palindrome [ "b"; "x" ] = false
let test6 = palindrome [] = true
