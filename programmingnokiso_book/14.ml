(* filter : ('a list -> 'b list) -> 'a list -> 'b list *)
let rec filter f = function
  | [] -> []
  | h :: t -> if f h then h :: filter f t else filter f t

let is_even n = if n mod 2 = 0 then true else false
let filter_test1 = filter is_even [ 1; 2; 3; 4; 5 ] = [ 2; 4 ]
