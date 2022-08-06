type ekimei_t = {
  kanji : string;
  kana : string;
  romaji : string;
  shozoku : string;
}

let myougadani =
  { kanji = "茗荷谷"; kana = "みょうがだに"; romaji = "myogadani"; shozoku = "丸の内線" }

let display station =
  match station with
  | { kanji; shozoku; kana } -> shozoku ^ ", " ^ kanji ^ "（" ^ kana ^ "）"

let test1 = display myougadani = "丸の内線, 茗荷谷（みょうがだに）"
