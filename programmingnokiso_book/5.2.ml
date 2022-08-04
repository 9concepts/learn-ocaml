(* 時間 t を受けて午前か午後かを返す *)
(* jikan : int -> string *)
let jikan t = if t mod 24 < 12 then "AM" else "PM"

(* テスト *)
let test = jikan 1 = "AM"
let test = jikan 0 = "AM"
let test = jikan 10 = "AM"
let test = jikan 12 = "PM"
let test = jikan 23 = "PM"
let test = jikan 24 = "AM"
let test = jikan 25 = "AM"
