def super_print(string, options = {})
  defaults = {
    :times => nil,
    :upcase => nil,
    :reverse => nil
  }

  if options[:times]
    string = (string * options[:times])
  end

  if options[:upcase]
    string.upcase!
  end

  if options[:reverse]
    string.reverse!
  end

  string

end

p super_print("Hello")                                    #=> "Hello"
p super_print("Hello", :times => 3)                       #=> "Hello" 3x
p super_print("Hello", :upcase => true)                   #=> "HELLO"
p super_print("Hello", :upcase => true, :reverse => true) #=> "OLLEH"
