module IntSet = Set.Make (struct
  type t = int

  let compare i j = i - j
end)

module type OrderedType = sig
  type t

  val compare : t -> t -> int
end

module MakeSet (Order : OrderedType) = struct
  type elt = Order.t
  type t = elt list

  let empty = []

  let rec mem elt = function
    | [] -> false
    | x :: rest ->
        let r = Order.compare elt x in
        r = 0 || (r > 0 && mem elt rest)

  let add elt = function
    | [] -> [ elt ]
    | x :: rest -> elt :: x :: rest
end

module MySet = MakeSet (struct
  type t = int

  let compare x y = x - y
end)
