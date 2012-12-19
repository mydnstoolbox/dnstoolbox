file = File.open("test.txt", "r")
file.each {|line| puts line}
file.close
