def calc(x, y)
    x*x+y*y
end
puts "input x>>"
x=(gets||'1').to_f
puts "input y>>"
y=(gets||'1').to_f

result=calc(x, y)

puts [x, y, result]