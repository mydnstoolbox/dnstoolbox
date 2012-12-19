if File.exists?"test.txt"
  file = File.open("test.txt", "a")
else
  file = File.new("test.txt", "w")
end
file.puts("test 123 123")
file.close
