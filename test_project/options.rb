option=ARGV[0]||'--option'

div =10
dx = []
(div+1).times do |i|
  dx << -1.0 + 2.0/div*i
end

dx.each do |x|
    puts x
    case option
        when '--option'
            puts ('redo with an option')
        when '--keyboard'
            system "ruby keyboard_input.rb"
        when '--file'
            File.write('in.txt', "#{x}\n1.0\n", mode: 'a+')
            system "ruby from_file.rb >out.txt"
    end
end