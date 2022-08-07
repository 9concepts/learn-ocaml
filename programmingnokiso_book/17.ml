type team_t = Red | White;;

Red

(* team_string : team_t -> string *)
let team_string team =
  match team with
  | Red -> "赤組"
  | White -> "白組"

type nengou_t = Meiji of int | Taisho of int | Showa of int | Heisei of int;;

Showa 42

(* binary tree *)
type tree_t = Empty | Leaf of int | Node of (tree_t * int * tree_t)

(* 木が格納している数の合計 *)
let sum_tree tree =
  let rec sum acc sub_tree =
    match sub_tree with
    | Empty -> acc
    | Leaf n -> acc + n
    | Node (left, n, right) -> sum 0 left + n + acc + sum 0 right
  in
  sum 0 tree

let rec sum_tree2 tree =
  match tree with
  | Empty -> 0
  | Leaf n -> n
  | Node (left, n, right) -> sum_tree2 left + n + sum_tree2 right

let tree_a = Node (Node (Empty, 7, Leaf 3), 17, Leaf 24)
let test_sum_tree = sum_tree tree_a = 51
let test_sum_tree2 = sum_tree2 tree_a = 51
