# file:./re_gets_examples.rb

line = "* fix calc kpoints:50, in_plane:0.98, vertical:1.00"

string = Regexp.new("\\* fix calc kpoints:50, in_plane:(.+), vertical:(.+)")
line =~ string
p [$1.to_f, $2.to_f] #=> [0.98, 1.00]

res = line.scan(string)
p res #=> [["0.98", "1.00"]]
p res[0].map(&:to_f) #=> [0.98, 1.0]

p m = line.match(string) 
#=> #<MatchData "* fix calc kpoints:50, in_plane:0.98, vertical:1.00" 1:"0.98" 2:"1.00">
p [m[1].to_f, m[2].to_f] #=> [0.98, 1.0]
p m[0], m[1], m[2]

require 'scanf'
p line.scanf("* fix calc kpoints:50, in_plane:%f, vertical:%f")
#=>[0.98, 1.0]

#---------Other Examples---------#

string=Regexp.new(/(?<month>\d{1,2})\/(?<day>\d{1,2})\/(?<year>\d{4})/)
line="Today's date is: 11/30/2024."
res=line.match(string)
p res[0], res[1], res
p res['year']

if "hi there".match(/hi/) 
    puts "match"
end
