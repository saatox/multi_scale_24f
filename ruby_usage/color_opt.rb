require 'colorize'

opts={}
if ARGV[0]== '-d'
    puts 'dryrun.'
    opts[:dryrun]=true
elsif ARGV[0]=='-m'
    opts[:message]=ARGV[1]
end

["git add -A",
"git commit",
"git pull origin main",
"git push origin main"].each do |comm|
    puts comm.green
    next if opts[:dryrun]
    system comm
end