def calc(x, y)
    x*x+x*y+y*y
end

lines=File.readlines("in.txt")

i=0
while (i<lines.length) do
    x = lines[i].chomp.to_f
    y = lines[i+1].chomp.to_f
    result = calc(x,y)
    p [x,y,result]
    i+=2
end

system "ruby for_plot.rb >results.txt"
  