type team_t = Red | White;;

Red

(* team_string : team_t -> string *)
let team_string team =
  match team with
  | Red -> "赤組"
  | White -> "白組"

type nengou_t = Meiji of int | Taisho of int | Showa of int | Heisei of int;;

Showa 42
