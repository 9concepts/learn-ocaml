let rec insert lst n =
  match lst with
  | [] -> [ n ]
  | first :: rest ->
      if first < n then first :: insert rest n else n :: first :: rest

let test1 = insert [ 1; 2; 4 ] 3 = [ 1; 2; 3; 4 ]
let test2 = insert [] 1 = [ 1 ]
let test3 = insert [ 2 ] 1 = [ 1; 2 ]
let test4 = insert [ 3; 45 ] 54 = [ 3; 45; 54 ]
