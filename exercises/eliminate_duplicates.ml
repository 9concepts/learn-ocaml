let rec compress = function
  | a :: (b :: _ as t) -> if a = b then compress t else a :: compress t
  | smaller -> smaller

(* my solution *)
(* let compress strings =
   let rec remove prev_str acc list =
     match list with
     | [] -> acc
     | h :: t ->
         if h = prev_str then remove h acc t else remove h (acc @ [ h ]) t
   in
   remove "" [] strings *)

let test =
  compress
    [ "a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e" ]
  = [ "a"; "b"; "c"; "a"; "d"; "e" ]
