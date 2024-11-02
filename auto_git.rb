#!/usr/bin/env ruby

["git add -A",
 "git commit -m \ 'comment\'",
 "git pull origin main",
 "git push origin main"].each do |comm|
 # puts comm
 #currently not working -> login not supported????
  system comm
end