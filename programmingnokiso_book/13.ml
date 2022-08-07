(* 実数のリストを受け取り、各要素の平方根をとったリストを返す *)
let rec map_sqrt = function
  | [] -> []
  | head :: rest -> sqrt head :: map_sqrt rest

let test_map_sqrt_1 = map_sqrt [ 1.; 2. ] = [ 1.; 1.41421356237309515 ]

(* map *)
(* map : ('a -> 'b) -> 'a list -> 'b list *)
let rec map f = function
  | [] -> []
  | head :: rest -> f head :: map f rest

let test_map_1 = map sqrt [ 1.; 2. ] = [ 1.; 1.41421356237309515 ]
(* 'a は型変数 *)
(* 型変数を含む型を多相型という *)
