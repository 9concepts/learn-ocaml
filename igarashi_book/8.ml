let read file_name =
  let input_ch = open_in file_name in
  let rec read_each () =
    print_endline (input_line input_ch);
    read_each ()
  in
  try read_each () with End_of_file -> close_in input_ch
;;

read "README.md"
