
require "scanf"

File.readlines("out.txt").each do |test|
    scan_array = "[%f, %f, %f]"
    data=test.scanf(scan_array)
    pp data
  end

