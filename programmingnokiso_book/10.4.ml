type person_t = { name : string }

let rec insert people person =
  match people with
  | [] -> [ person ]
  | ({ name } as first) :: rest -> (
      match person with
      | { name = new_name } ->
          if name < new_name then first :: insert rest person
          else person :: first :: rest)

(* 名前順にソートする *)
let rec person_sort people =
  match people with
  | [] -> []
  | first :: rest -> insert (person_sort rest) first

let test1 =
  person_sort [ { name = "A" }; { name = "C" }; { name = "D" }; { name = "B" } ]
  = [ { name = "A" }; { name = "B" }; { name = "C" }; { name = "D" } ]
