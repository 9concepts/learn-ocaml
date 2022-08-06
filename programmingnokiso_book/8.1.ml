type book_t = {
  title : string;
  author_name : string;
  publisher : string;
  price : int;
  isbn : string;
}

type mook_t = {
  title : string;
  author_name : string;
  publisher : string;
  isbn : string;
}

let book1 =
  { title = "hoge"; author_name = "a"; publisher = "b"; price = 0; isbn = "a" }

let book2 =
  { title = "a"; author_name = "b"; publisher = "a"; price = 0; isbn = "" }

let book3 = { title = "a"; author_name = "b"; publisher = "a"; isbn = "" }
