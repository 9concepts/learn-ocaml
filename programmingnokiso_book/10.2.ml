let rec insert lst n =
  match lst with
  | [] -> [ n ]
  | first :: rest ->
      if first < n then first :: insert rest n else n :: first :: rest

let test1 = insert [ 1; 2; 4 ] 3 = [ 1; 2; 3; 4 ]
let test2 = insert [] 1 = [ 1 ]
let test3 = insert [ 2 ] 1 = [ 1; 2 ]
let test4 = insert [ 3; 45 ] 54 = [ 3; 45; 54 ]

(* 整数のリストを受け取り、昇順にソートする *)
let rec ins_sort lst =
  match lst with
  | [] -> []
  | first :: rest -> insert (ins_sort rest) first

let test5 = ins_sort [ 5; 3; 8; 1; 7; 4 ] = [ 1; 3; 4; 5; 7; 8 ]
let test6 = ins_sort [ 1; 2 ] = [ 1; 2 ]
let test6 = ins_sort [ 2; 1 ] = [ 1; 2 ]
let test7 = ins_sort [] = []
