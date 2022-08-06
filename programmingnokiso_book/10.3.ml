type student_t = { name : string; score : int }

let rec insert student_list student =
  match student_list with
  | [] -> [ student ]
  | ({ score } as first) :: rest -> (
      match student with
      | { score = new_score } ->
          if score < new_score then first :: insert rest student
          else student :: first :: rest)
(* let rec insert student_list student =
   match student_list with
   | [] -> [ student ]
   | first :: rest ->
       if first.score < student.score then first :: insert rest student
       else student :: first :: rest *)

let test1 =
  insert
    [ { name = "Z"; score = 9 }; { name = "A"; score = 999 } ]
    { name = "B"; score = 99 }
  = [
      { name = "Z"; score = 9 };
      { name = "B"; score = 99 };
      { name = "A"; score = 999 };
    ]

let rec student_sort students =
  match students with
  | [] -> []
  | first :: rest -> insert (student_sort rest) first

let test2 =
  student_sort
    [
      { name = "B"; score = 99 };
      { name = "A"; score = 999 };
      { name = "Z"; score = 9 };
    ]
  = [
      { name = "Z"; score = 9 };
      { name = "B"; score = 99 };
      { name = "A"; score = 999 };
    ]
