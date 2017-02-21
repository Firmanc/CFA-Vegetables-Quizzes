class Computer
 attr_accessor :name
 def initialize(name)
   @name = name
   @score = 0
 end


 def assign_prob(answers)
   case answers
     when 'A'
       return random_answer({"A" => 70, "B" => 10, "C" => 10, "D" => 10 })
     when 'B'
       return random_answer({"A" => 10, "B" => 70, "C" => 10, "D" => 10 })
     when 'C'
       return random_answer({"A" => 10, "B" => 10, "C" => 70, "D" => 10 })
     when 'D'
       return random_answer({"A" => 10, "B" => 10, "C" => 10, "D" => 70 })
   end
 end

 def random_answer(options)
   #assigning the percentages
   totalSize = 100
   #produce a random random from 100
   answer = rand(totalSize)
   #value to assign for probability
   current_stack = 0
   #loop matching the random number with the answer
   options.each do |choice, probability|
     if (answer <= current_stack + probability)
       return choice
     else
       current_stack += probability
     end
   end
   return nil
 end
end

bob = Computer.new("bob")
x = "D"
10.times do
puts bob.assign_prob(x)
end
