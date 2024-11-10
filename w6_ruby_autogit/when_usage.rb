require 'colorize'

opts={}

case ARGV[0]
when '-d'
    puts 'dryrun.'
    opts[:dryrun]=true
when '-m'
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