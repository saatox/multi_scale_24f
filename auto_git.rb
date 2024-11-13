#!/usr/bin/env ruby

comment=ARGV[0]

["git add -A",
 "git commit -m  #{comment}",
 "git pull origin main",
 "git push origin main"].each do |comm|
 # puts comm
 #currently not working -> login not supported????
  system comm
end