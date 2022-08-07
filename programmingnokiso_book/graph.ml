type ekimei_t = {
  kanji : string;
  kana : string;
  romaji : string;
  shozoku : string;
}

let global_ekimei_list =
  [
    { kanji = "池袋"; kana = "いけぶくろ"; romaji = "ikebukuro"; shozoku = "丸の内線" };
    { kanji = "新大塚"; kana = "しんおおつか"; romaji = "shinotsuka"; shozoku = "丸の内線" };
    { kanji = "茗荷谷"; kana = "みょうがだに"; romaji = "myogadani"; shozoku = "丸の内線" };
  ]

type ekikan_t = {
  kiten : string;
  shuten : string;
  keiyu : string;
  kyori : float;
  jikan : int; (* minutes *)
}
