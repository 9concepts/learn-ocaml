type language_t = Japanese | English

let japanese_message = "こんにちは"
let english_message = "Hello"

let greet language =
  match language with
  | Japanese -> japanese_message
  | English -> english_message
