type distance_t = {
  (* 前の点からの距離 *) kyori : float;
  (* 始点からの距離の合計 *) total : float;
}

let ds_before =
  [
    { kyori = 0.3; total = 0. };
    { kyori = 0.9; total = 0. };
    { kyori = 1.4; total = 0. };
    { kyori = 0.8; total = 0. };
  ]

let ds_after =
  [
    { kyori = 0.3; total = 0.3 };
    { kyori = 0.9; total = 1.2 };
    { kyori = 1.4; total = 2.6 };
    { kyori = 0.8; total = 3.4 };
  ]

let total_distance distances =
  let rec sum count = function
    | [] -> []
    | { kyori; total } :: rest ->
        { kyori; total = count +. kyori } :: sum (count +. kyori) rest
  in
  sum 0. distances
(* let total_distance distances =
   let rec sum count before_list after_list =
     match before_list with
     | [] -> after_list
     | { kyori; total } :: rest ->
         sum (count +. kyori) rest
           ({ kyori; total = count +. kyori } :: after_list)
   in
   List.rev (sum 0. distances []) *)

let test_total_distance = total_distance ds_before = ds_after
let test_total_distance = total_distance ds_before
