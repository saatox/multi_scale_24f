require "scanf"
File.readlines("out.txt")[0..1].each do |line|
  p scan_string = "[%f, %f, %f]"
  p line
  p line.scanf(scan_string)
end
puts "----------------"
File.readlines("out.txt").each do |test|
    scan_array = "[%f, %f, %f]"
    scan_string="%s %s %s"
    p test.chomp
    p test.scanf(scan_array)
    p test.scanf(scan_string)
  end
