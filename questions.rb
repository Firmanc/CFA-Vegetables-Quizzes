class Questions
  def initialize
    @questions = []
    @answers = []
    @hashed_ans = Hash.new
  end

  attr_accessor :questions, :answers ,:options

#method to obtain the questions from a text file
  def getting_questions(file)
       File.readlines(file).each do |x|
           @questions << x.split(":")
      end
  end

  def attc_value(selection)
    @hashed_ans["A"] = selection[1]
    @hashed_ans["B"] = selection[2]
    @hashed_ans["C"] = selection[3]
    @hashed_ans["D"] = selection[4]
  end


# method which asks questions...

  def ask_questions(opponent, person)

    @questions.length.times do |ary|
      #[0..4] shows the first five items of the every question array
      current_questions = Array.new(@questions[ary])
      attc_value(current_questions)
      puts current_questions[0..4]
      #storing the right answer
      right_answer = current_questions.last.to_s
      right_answer = right_answer.delete("\n")

      #asking a player the questions and getting the result
      puts "\nWhat do you choose? Select from A, B, C or D"
      get_answer = gets.chomp.upcase
      #store the value of the answer
      player_answer = @hashed_ans[get_answer]
      #calling the result method for the player
      boolean_answers_person(person, get_answer, right_answer, player_answer)
      #obtaining the result from the computer opponent
      com_answer = opponent.assign_prob(right_answer)
      com_display = @hashed_ans[com_answer]
      #calling the result method for the computer
      boolean_answers_computer(opponent, com_answer, right_answer, com_display)
      #putting the answer into the answer array
      @answers << player_answer

      puts "\nPress Enter to continue"
      gets.chomp
      system("clear")

    end
end
 # a method to decide if the player answer correctly
 def boolean_answers_person(player, player_result, right_result, dsp_result)
    #condition matching the player result with right result
    #if ["A","B","C","D"].include? player_result
      if player_result == right_result
        puts "you picked #{dsp_result}"
        puts "You got it right!"
        player.increase_score
      else
        puts "you picked #{dsp_result}"
        puts "You got that wrong!"
      end
  #  else
  #  end
  end


# a method if the computer produce the right answer
  def boolean_answers_computer(computer, com_result, right_result, display_rst)
    if com_result == right_result

      puts "\naannnndddddd #{computer.name} select...."
      $stdout.flush
      sleep(2)
      puts "\n>#{display_rst}"
      puts "\n#{computer.name} is correct"
      computer.increase_score
    else
      puts "\naannnndddddd #{computer.name} select...."
      $stdout.flush
      sleep(2)
      puts "\n>#{display_rst}"
      puts "\n> #{computer.name} is wrong!"

    end
  end
end
