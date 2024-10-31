def greeting(name)
    strings=["Hello", name]
    strings.join(" ")+"."
end

name='bob'
puts greeting(name)