type gakusei_t = { name : string; score : int }

let gakusei_a = { name = "Mike"; score = 90 }
let gakusei_b = { name = "Bike"; score = 190 }
let gakusei_c = { name = "Cike"; score = 990 }
let gakusei_d = { name = "Dike"; score = 80 }
let gakusei_zero = { name = "Zero"; score = 0 }

(* 目的: gakusei_t のリストの中で再考得点の学生を返す *)
let rec gakusei_max gakusei_list =
  match gakusei_list with
  | [] -> { name = ""; score = min_int }
  | ({ score } as first) :: rest ->
      if
        score
        >
        match gakusei_max rest with
        | { score = max_score } -> max_score
      then first
      else gakusei_max rest

(* test *)
let test1 =
  gakusei_max [ gakusei_a; gakusei_b; gakusei_c; gakusei_d ] = gakusei_c

let test2 = gakusei_max [] = { name = ""; score = min_int }
let test3 = gakusei_max [ gakusei_zero ] = gakusei_zero
