let rec print_list l =
  match l with
  | [] -> ()
  | head :: rest ->
      print_int head;
      print_string " ";
      print_list rest

(* 二重配列 l を受け取り、要素配列の先頭に要素 x を追加する *)
let rec add_to_each l x =
  match l with
  | [] -> []
  | first :: rest -> (x :: first) :: add_to_each rest x

let test1 =
  add_to_each [ [ 0 ]; [ 12; 23 ]; [ 90; 9 ] ] 999
  = [ [ 999; 0 ]; [ 999; 12; 23 ]; [ 999; 90; 9 ] ]

let rec prefix l =
  match l with
  | [] -> []
  | head :: rest -> [ head ] :: add_to_each (prefix rest) head

let test2 = prefix [] = []
let test2 = prefix [ 1 ] = [ [ 1 ] ]
let test2 = prefix [ 1; 2 ] = [ [ 1 ]; [ 1; 2 ] ]

let test2 =
  prefix [ 1; 2; 3; 4 ] = [ [ 1 ]; [ 1; 2 ]; [ 1; 2; 3 ]; [ 1; 2; 3; 4 ] ]

let rec insert lst n =
  match lst with
  | [] -> [ n ]
  | first :: rest ->
      if first < n then first :: insert rest n else n :: first :: rest

let rec insert_sort lst =
  match lst with
  | [] -> []
  | first :: rest -> insert (insert_sort rest) first

(* リストの最小値を求める *)
(* let min lst =
   match insert_sort lst with
   | [] -> max_int
   | first :: rest -> first *)
let rec min lst =
  match lst with
  | [] -> max_int
  | first :: rest ->
      let min_rest = min rest in
      if first < min_rest then first else min_rest

let test3 = min [ 2; 3; 4; 5; 1 ] = 1
let test4 = min [ 99; 2; 3; 4; 5 ] = 2
let test5 = min [ 9; 3; 4; 5 ] = 3
let test6 = min [] = max_int

type gakusei_t = { name : string; grade : string; score : int }

let gakusei_a = { name = "Aike"; grade = "A"; score = 99 }
let gakusei_b = { name = "Bike"; grade = "A"; score = 99 }
let gakusei_c = { name = "Cike"; grade = "B"; score = 80 }
let gakusei_d = { name = "Dike"; grade = "C"; score = 76 }
let gakusei_e = { name = "Eike"; grade = "C"; score = 79 }
let gakusei_f = { name = "Fike"; grade = "C"; score = 72 }
let gakusei_g = { name = "Gike"; grade = "D"; score = 24 }

(* 目的: gakusei_t のレコードを受け取り、成績ごとの人数を集計した組を返す *)
let rec shukei students =
  match students with
  | [] -> (0, 0, 0, 0)
  | { grade } :: rest ->
      let a, b, c, d = shukei rest in
      if grade = "A" then (a + 1, b, c, d)
      else if grade = "B" then (a, b + 1, c, d)
      else if grade = "C" then (a, b, c + 1, d)
      else if grade = "D" then (a, b, c, d + 1)
      else (a, b, c, d)
(* let rec shukei students =
   match students with
   | [] -> (0, 0, 0, 0)
   | { grade } :: rest -> (
       match shukei rest with
       | a, b, c, d ->
           if grade = "A" then (a + 1, b, c, d)
           else if grade = "B" then (a, b + 1, c, d)
           else if grade = "C" then (a, b, c + 1, d)
           else if grade = "D" then (a, b, c, d + 1)
           else (a, b, c, d)) *)

let test7 =
  shukei
    [
      gakusei_a;
      gakusei_b;
      gakusei_c;
      gakusei_d;
      gakusei_e;
      gakusei_f;
      gakusei_g;
    ]
  = (2, 1, 3, 1)
