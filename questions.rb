class Questions
  def initialize
    @questions = []
    @answers = []
  end

  attr_accessor :questions, :answers ,:options

#method to obtain the questions from a text file
  def getting_questions(file)
       File.readlines(file).each do |x|
           @questions << x.split(":")
      end
  end


# method which asks questions...

  def ask_questions(opponent, person)

    @questions.length.times do |ary|
      #[0..4] shows the first five items of the every question array
      puts @questions[ary][0..4]
      #storing the right answer
      right_answer = @questions[ary].last.to_s
      right_answer = right_answer.delete("\n")

      #asking a player the questions and getting the result
      puts "\nWhat do you choose? Select from A, B, C or D"
      player_answer = gets.chomp.upcase

      #calling the result method for the player
      boolean_answers_person(person, player_answer, right_answer)
      #obtaining the result from the computer opponent
      com_answer = opponent.assign_prob(right_answer)
      #calling the result method for the computer
      boolean_answers_computer(opponent, com_answer, right_answer)
      #putting the answer into the answer array
      @answers << player_answer

      puts "\nPress Enter to continue"
      gets.chomp
      system("clear")

    end
end
 # a method to decide if the player answer correctly
 def boolean_answers_person(player, player_result, right_result)
    #condition matching the player result with right result

    if player_result == right_result
      puts "You got it right!"
      player.increase_score
    else
      puts "You got that wrong!"
    end
  end

# a method if the computer produce the right answer
  def boolean_answers_computer(computer, com_result, right_result)
    if com_result == right_result
      puts "\naannnndddddd #{computer.name} select...."
      $stdout.flush
      sleep(2)
      puts "\n> Selected #{com_result} \n#{computer.name} is correct"
      computer.increase_score
    else
      puts "\naannnndddddd #{computer.name} select...."
      $stdout.flush
      sleep(2)
      puts "\n> Selected #{com_result} \n#{computer.name} is wrong!"

    end
  end
end
