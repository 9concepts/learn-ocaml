type eki_t = { namae : string; saitan_kyori : float; temae_list : eki_t list }

let ikebukuro = { namae = "池袋"; saitan_kyori = 10.; temae_list = [] }

let shinjuku = { namae = "新宿"; saitan_kyori = 10.; temae_list = [ ikebukuro ] }
