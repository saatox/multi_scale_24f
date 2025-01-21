option=ARGV[0]||'default'

require "scanf"


case option
    when 'default'
        puts ('redo with an option (--help to view options)')
    when '--help'
        puts ("--thisyear for this year's spotify wrapped")
        puts ("--alltime for results on your entire spotify library")
    when '--thisyear'
        puts ("input additional option:")
        secondary='hehe'
        secondary=STDIN.gets.chomp
        case secondary
            when 'help'
                puts('wrapped: summary of this year\'s spotify activity')
                puts('comparison: compare this year\'s activity to last year\'s')
            when 'wrapped'
                system "python this_year.py --wrapped"
            when 'comparison'
                system "python this_year.py --comparison"
            else
                puts ("choose from options wrapped or comparison. select help for more details.")
        end
    when '--alltime'
        system "python all_time.py"
    else
        puts ('redo with a viable option (--help to view options)')
end


