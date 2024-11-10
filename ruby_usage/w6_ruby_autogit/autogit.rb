if ARGV[0]== '-d'
    puts 'dryrun.'
    dryrun=true
end

["git add -A",
"git commit",
"git pull origin main",
"git push origin main"].each do |comm|
    puts comm
    unless dryrun
        system comm
    end
end