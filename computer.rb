class Computer
 attr_accessor :name, :score
 def initialize(name)
   @name = name
   @score = 0
 end


 def assign_prob(answers)
   case answers
     when 'A'
       return random_answer({"A" => 25, "B" => 25, "C" => 25, "D" => 25 })
     when 'B'
       return random_answer({"A" => 25, "B" => 25, "C" => 25, "D" => 25 })
     when 'C'
       return random_answer({"A" => 25, "B" => 25, "C" => 25, "D" => 25 })
     when 'D'
       return random_answer({"A" => 25, "B" => 25, "C" => 25, "D" => 25 })
   end
 end

 def assign_total
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

 def increase_score
   @score = @score + 1
 end

end
