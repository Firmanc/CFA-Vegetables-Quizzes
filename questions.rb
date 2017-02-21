class Questions
  def initialize
    @questions = [
    ["Where is Honolu?", "A", "B", "C", "D", "A"],
    ["What Vegie is the best?", "A", "B", "C", "D", "B"],
    ["Carrot has calcium?", "A", "B", "C", "D", "C"],
    ]
    @answers = []    # saves the answers inside an array
  end

  attr_accessor :questions, :answers

# method which asks questions...

  def ask_questions(opponent, person)

    @questions.each do |ary|
      #[0..4] shows the first five items of the 1st array
      puts ary[0..4]
      #storing the right answer
      right_answer = ary[5]
      #asking a player the questions and getting the result
      puts "What do you choose? Select from A, B, C or D"
      player_answer = gets.chomp.upcase
      #calling the result method for the player
      boolean_answers_person(person, player_answer, right_answer)
      #obtaining the result for the computer opponent
      com_answer = opponent.assign_prob(right_answer)
      #calling the result method for the computer
      boolean_answers_computer(opponent, com_answer, right_answer)
      #putting the answer into the answer array
      @answers << player_answer

      puts ""
      puts "Press Enter to continue"
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
      puts "The computer select #{com_result}, that is correct"
      computer.increase_score
    else
      puts "The computer select #{com_result}, that is wrong!"

    end
  end
end
