class Computer
 attr_accessor :name, :score
 def initialize(name)
   @name = name
   @score = 0
 end


 def assign_prob(answers)
   case answers
     when 'A'
       return random_answer({"A" => 35, "B" => 15, "C" => 15, "D" => 15 })
     when 'B'
       return random_answer({"A" => 15, "B" => 35, "C" => 15, "D" => 15 })
     when 'C'
       return random_answer({"A" => 15, "B" => 15, "C" => 35, "D" => 15 })
     when 'D'
       return random_answer({"A" => 15, "B" => 15, "C" => 15, "D" => 35 })
   end
 end

 def increase_score
   @score = @score + 10
 end

 def random_answer(options)
   #assigning the percentages
   totalSize = 0

   options.each do |value, size|
    totalSize = totalSize + size
    end
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
