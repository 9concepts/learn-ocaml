print_endline (Language.greet Japanese)

(* print_endline Language.english_message *)

module Hello : sig
  val hello : unit -> unit
end = struct
  let message = "Hello"
  let hello () = print_endline message
end

module type Goodbye_type = sig
  val goodbye : unit -> unit
end

module Goodbye : Goodbye_type = struct
  let goodbye () = print_endline "Goodbye"
end
;;

Hello.hello ();;
Goodbye.goodbye ()
