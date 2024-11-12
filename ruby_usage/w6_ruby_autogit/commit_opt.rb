require 'colorize'

opts={}

case ARGV[0]
when '-d'
    puts 'dryrun.'
    opts[:dryrun]=true
when '-m'
    opts[:message]=ARGV[1]
end

commit = if opts[:message]
            "git commit -m \'#opts[:message]}\'"
         else
            "git commit"
         end


["git add -A",
commit,
"git pull origin main",
"git push origin main"].each do |comm|
    puts comm.green
    next if opts[:dryrun]
    system comm
end