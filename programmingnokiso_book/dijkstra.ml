type edge_t = { from_v : string; to_v : string; dist : float }

let all_edges =
  [
    (* A -> ? *)
    { from_v = "A"; to_v = "B"; dist = 10.0 };
    { from_v = "A"; to_v = "D"; dist = 4.0 };
    (* B -> ? *)
    { from_v = "B"; to_v = "A"; dist = 10.0 };
    { from_v = "B"; to_v = "C"; dist = 2.0 };
    { from_v = "B"; to_v = "E"; dist = 2.0 };
    (* C -> ? *)
    { from_v = "C"; to_v = "B"; dist = 2.0 };
    { from_v = "C"; to_v = "E"; dist = 1.0 };
    (* D -> ? *)
    { from_v = "D"; to_v = "A"; dist = 4.0 };
    { from_v = "D"; to_v = "E"; dist = 3.0 };
    (* E -> ? *)
    { from_v = "E"; to_v = "B"; dist = 2.0 };
    { from_v = "E"; to_v = "C"; dist = 1.0 };
    { from_v = "E"; to_v = "D"; dist = 3.0 };
  ]

let all_nodes = [ "A"; "B"; "C"; "D"; "E" ]

type node_t = { name : string; min_dist : float; path : string list }

(* 2つのノードが直接つながっているか *)
let rec find_edge edges p q =
  match edges with
  | [] -> None
  | ({ from_v; to_v } as head) :: rest ->
      if (from_v = p && to_v = q) || (from_v = q && to_v = p) then Some head
      else find_edge rest p q

let test_find_edge_0 = find_edge all_edges "A" "A" = None

let test_find_edge_1 =
  find_edge all_edges "A" "B" = Some { from_v = "A"; to_v = "B"; dist = 10.0 }

let test_find_edge_2 = find_edge all_edges "A" "C" = None

let test_find_edge_3 =
  find_edge all_edges "A" "D" = Some { from_v = "A"; to_v = "D"; dist = 4.0 }

let test_find_edge_4 = find_edge all_edges "A" "E" = None

let test_find_edge_5 =
  find_edge all_edges "B" "C" = Some { from_v = "B"; to_v = "C"; dist = 2.0 }

let test_find_edge_6 = find_edge all_edges "B" "D" = None

let test_find_edge_7 =
  find_edge all_edges "D" "A" = Some { from_v = "A"; to_v = "D"; dist = 4.0 }

let test_find_edge_8 = find_edge all_edges "D" "B" = None
let test_find_edge_9 = find_edge all_edges "D" "C" = None

let test_find_edge_10 =
  find_edge all_edges "D" "E" = Some { from_v = "D"; to_v = "E"; dist = 3.0 }

(* 2つのノードp, qがつながっていたら、qの最短距離とパスを更新して返す。つながっていない場合はqを返す *)
let koushin1 p q =
  match (p, q) with
  | ( { name = p_name; min_dist = p_min_dist; path = p_path },
      { name = q_name; min_dist = q_min_dist } ) -> (
      match find_edge all_edges p_name q_name with
      | None -> q
      | Some { from_v; to_v; dist } ->
          if dist +. p_min_dist < q_min_dist then
            {
              name = q_name;
              min_dist = dist +. p_min_dist;
              path = q_name :: p_path;
            }
          else q)

let test_koushin1_0 =
  koushin1
    { name = "A"; min_dist = 0.; path = [ "A" ] }
    { name = "B"; min_dist = infinity; path = [] }
  = { name = "B"; min_dist = 10.0; path = [ "B"; "A" ] }

let test_koushin1_1 =
  koushin1
    { name = "E"; min_dist = 7.; path = [ "E"; "D"; "A" ] }
    { name = "B"; min_dist = 10.0; path = [ "B"; "A" ] }
  = { name = "B"; min_dist = 9.0; path = [ "B"; "E"; "D"; "A" ] }

(* 直前に確定したノード p と未確定のノードのリストを受け取り、必要な更新処理を行った後の未確定のノードのリストを返す *)
let koushin p v_list = List.map (koushin1 p) v_list

let test_koushin_0 =
  koushin
    { name = "A"; min_dist = 0.; path = [ "A" ] }
    [
      { name = "B"; min_dist = infinity; path = [] };
      { name = "C"; min_dist = infinity; path = [] };
      { name = "D"; min_dist = infinity; path = [] };
      { name = "E"; min_dist = infinity; path = [] };
    ]
  = [
      { name = "B"; min_dist = 10.; path = [ "B"; "A" ] };
      { name = "C"; min_dist = infinity; path = [] };
      { name = "D"; min_dist = 4.; path = [ "D"; "A" ] };
      { name = "E"; min_dist = infinity; path = [] };
    ]

(* ノードのリストの中から最短距離が最小のノード p を返す *)
let rec min_node node_list =
  match node_list with
  | [] -> { name = ""; min_dist = infinity; path = [] }
  | head :: rest ->
      if head.min_dist < (min_node rest).min_dist then head else min_node rest

let test_min_node =
  min_node
    [
      { name = "A"; min_dist = 0.; path = [ "A" ] };
      { name = "B"; min_dist = 9.; path = [ "B"; "E"; "D"; "A" ] };
      { name = "C"; min_dist = 8.; path = [ "C"; "E"; "D"; "A" ] };
      { name = "D"; min_dist = 4.; path = [ "D"; "A" ] };
      { name = "E"; min_dist = 7.; path = [ "E"; "D"; "A" ] };
    ]
  = { name = "A"; min_dist = 0.; path = [ "A" ] }

let rec filter f = function
  | [] -> []
  | h :: t -> if f h then h :: filter f t else filter f t

(* dijkstra : node_t -> node_t list *)
let dijkstra start_node v_list =
  let rec aux u v =
    match v with
    | [] -> u
    | head :: rest ->
        let next_node = min_node v in
        let is_not_same_node = function
          | { name } -> name <> next_node.name
        in
        aux (next_node :: u) (koushin next_node (filter is_not_same_node v))
  in
  aux [] (start_node :: v_list)

let test_dijkstra =
  dijkstra
    { name = "A"; min_dist = 0.; path = [ "A" ] }
    [
      { name = "B"; min_dist = infinity; path = [] };
      { name = "C"; min_dist = infinity; path = [] };
      { name = "D"; min_dist = infinity; path = [] };
      { name = "E"; min_dist = infinity; path = [] };
    ]
  = [
      { name = "B"; min_dist = 9.; path = [ "B"; "E"; "D"; "A" ] };
      { name = "C"; min_dist = 8.; path = [ "C"; "E"; "D"; "A" ] };
      { name = "E"; min_dist = 7.; path = [ "E"; "D"; "A" ] };
      { name = "D"; min_dist = 4.; path = [ "D"; "A" ] };
      { name = "A"; min_dist = 0.; path = [ "A" ] };
    ]
