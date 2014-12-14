
file_name = ARGV[0]
file_name_formatted = file_name.sub(".txt", "")
text_array = File.readlines(file_name)
text_array.shuffle!

File.open("#{ file_name_formatted }-shuffled", "w") do |f|
  f.puts text_array
end
