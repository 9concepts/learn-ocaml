let read file_name =
  let in_ch = open_in file_name in
  let rec each_read () =
    print_endline (input_line in_ch);
    each_read ()
  in
  try each_read () with End_of_file -> close_in in_ch

let () =
  for i = 1 to Array.length Sys.argv - 1 do
    read Sys.argv.(i)
  done
