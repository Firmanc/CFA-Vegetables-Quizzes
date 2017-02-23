class Questions
  def initialize
    @questions = []
    @answers = []
    @player_correct = []
    @computer_correct = []
    @hashed_ans = Hash.new
    @player = "\u{1f988}"
    @computer = "\u{1f693}"
    @start = "\u{1f3e6}"
    @goal = "\u{1f681}"
    @player_pos = [40]
    @computer_pos = [50]
    @level1_string = " " * 2 + @goal + " " * 49 + @start
  end

  attr_accessor :hashed_ans, :questions, :answers ,:options, :player_correct, :computer_correct, :player, :computer, :player_pos, :computer_pos, :player_correct, :computer_correct, :level1_string

#method to obtain the questions from a text file
  def getting_questions(file)
    CSV.foreach(file, :encoding => 'windows-1251:utf-8') do |row|
      @questions << [row[0],row[1],row[2],row[3],row[4],row[5]]
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
      set_position
      animation
      #[0..4] shows the first five items of the every question array
      current_questions = Array.new(@questions[ary])
      attc_value(current_questions)
      puts current_questions[0..4]
      #storing the right answer
      right_answer = current_questions.last.to_s
      right_answer = right_answer.delete("\n")

      #asking a player the questions and getting the result
      puts "\nSelect your answer"
      get_answer = ""
      condition = false
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
      if player_result == right_result
        system("clear")
        view_current
        puts "You picked: \n#{dsp_result}"
        puts "Woo! Correct!" + " \u{2705}" + "  " + "\u{1f600}"
        player.increase_score
        @player_correct << true
      else
        system("clear")
        view_current
        puts "You picked: \n#{dsp_result}"
        puts "Fail bro." + " \u{274c}" + "  " + "\u{1f625}"
        @player_correct << false
      end
  end

# a method if the computer produce the right answer
  def boolean_answers_computer(computer, com_result, right_result, display_rst)
    if com_result == right_result
      puts "\n#{computer.name} selected: "
      $stdout.flush
      sleep(1.5)
      puts "#{display_rst}"
      puts "#{computer.name} is catching up!" + " \u{2705}" + "  " + "\u{1f600}"
      computer.increase_score
      @computer_correct << true
    else
      puts "\n#{computer.name} selected: "
      $stdout.flush
      # sleep(1.5)
      puts "#{display_rst}"
      puts "#{computer.name} is falling behind, hurry RUN faster!" + " \u{274c}" + "  " + "\u{1f625}"
      @computer_correct << false
    end
  end

  def set_position
    if @player_correct[-1] == true
      @player_pos << (@player_pos[-1]) - 5
    else
      @player_pos << @player_pos[-1]
    end
    if @computer_correct[-1] == true
      @computer_pos << (@computer_pos[-1]) - 5
    else
      @computer_pos << @computer_pos[-1]
    end
  end

  def view_current
    system('clear')
    @level1_string[@player_pos[-1]] = @player
    @level1_string[@computer_pos[-1]] = @computer
    insert_sky
    puts @level1_string
    insert_landscape
  end

  def starting_animation
    x = 49
    string = " " * 2 + @goal + " " * 46 + @player + "  " + @start
    9.times do
      system('clear')
      insert_sky
      string[x-1] = @player
      string[x] = " "
      string[x+1] = "\u{1f4b0}"
      string[x+2] = " "
      puts string
      insert_landscape
      x -= 1
      sleep 0.1
    end
  end

  def ending_animation
    x = 0
    20.times do
      system('clear')
      print "\n" * x
      insert_sky
      puts @level1_string
      insert_landscape
      x += 1
      sleep 0.07
    end
  end

  def animation
    x = -1
    y = -1
    player_movement = (@player_pos[-2] - @player_pos[-1]) / 5
    computer_movement = (@computer_pos[-2] - @computer_pos[-1]) / 5
    5.times do
      system('clear')
      if player_movement == 1
      #   if @player_pos[-1] == 0
      #     a = -1
      #     b = -1
      #     3.times do
      #       if player_movement == 1
      #         @level1_string[@player_pos[-2] + player_movement * a + 1] = " "
      #         @level1_string[@player_pos[-2] + player_movement * a + 2] = "\u{1f4b0}"
      #         @level1_string[@player_pos[-2] + player_movement * a + 3] = " "
      #         @level1_string[@player_pos[-2] + player_movement * a] = @player
      #         @level1_string[2] = @goal
      #         @level1_string[52] = @start
      #       end
      #       if computer_movement == 1
      #         @level1_string[@computer_pos[-2] + computer_movement * b + 1] = " "
      #         @level1_string[@computer_pos[-2] + computer_movement * b + 2] = "\u{1f4a8}"
      #         @level1_string[@computer_pos[-2] + computer_movement * b + 3] = " "
      #         @level1_string[@computer_pos[-2] + computer_movement * b] = @computer
      #         @level1_string[2] = @goal
      #         @level1_string[52] = @start
      #       end
      #     end
      #     insert_sky
      #     puts @level1_string
      #     insert_landscape
      #     puts @level1_string.length
      #     puts "Player's current position: " + @player_pos[-1].to_s
      #     puts "Computer's current position: " + @computer_pos[-1].to_s
      #     puts "Player formula: " + (@player_pos[-2] + (player_movement * x)).to_s
      #     puts "Computer formula: " + (@computer_pos[-2] + (computer_movement * y)).to_s
      #     x -= 1
      #     y -= 1
      #     sleep 0.07
      #     ending_animation
      #     break
      #   end
        @level1_string[@player_pos[-2] + player_movement * x + 1] = " "
        @level1_string[@player_pos[-2] + player_movement * x + 2] = "\u{1f4b0}"
        @level1_string[@player_pos[-2] + player_movement * x + 3] = " "
        @level1_string[@player_pos[-2] + player_movement * x] = @player
        @level1_string[2] = @goal
        @level1_string[52] = @start
      end
      if computer_movement == 1
        @level1_string[@computer_pos[-2] + computer_movement * y + 1] = " "
        @level1_string[@computer_pos[-2] + computer_movement * y + 2] = "\u{1f4a8}"
        @level1_string[@computer_pos[-2] + computer_movement * y + 3] = " "
        @level1_string[@computer_pos[-2] + computer_movement * y] = @computer
        @level1_string[2] = @goal
        @level1_string[52] = @start
      end
      insert_sky
      puts @level1_string
      insert_landscape
      # puts @level1_string.length
      # puts "Player's current position: " + @player_pos[-1].to_s
      # puts "Computer's current position: " + @computer_pos[-1].to_s
      # puts "Player formula: " + (@player_pos[-2] + (player_movement * x)).to_s
      # puts "Computer formula: " + (@computer_pos[-2] + (computer_movement * y)).to_s
      x -= 1
      y -= 1
      sleep 0.07
    end
    @level1_string[@player_pos[-2] + player_movement * x + 3] = " "
    @level1_string[@computer_pos[-2] + computer_movement * y + 3] = " "
    if @player_pos[-1] == @computer_pos[-1]
      explosion_animation
    # elsif @player_pos[-1] == 0
    #   ending_animation
    else
      system('clear')
      insert_sky
      @level1_string[52] = @start
      puts @level1_string
      insert_landscape
    end
  end

  def explosion_animation
    sleep 0.15
    system('clear')
    @level1_string[@computer_pos[-1]] = " "
    insert_sky
    puts @level1_string
    insert_landscape
    sleep 0.07
    system('clear')
    @level1_string[@computer_pos[-1]] = "\u{1f4a5}"
    insert_sky
    puts @level1_string
    insert_landscape
  end

  def insert_landscape
    puts ("\u{1f4b5}" + " " + "\u{1f4b4}" +  " " + "\u{1f4b6}" +  " " + "\u{1f4b7}" +  " ") * 8 # line of cash?
  end

  def insert_sky
    puts " " * 41 + +"\u{2728} " + "\u{1f31b}" + " \u{2728}"
    puts
  end

  # def addanswers
  #   print "Add player answer: "
  #   input = gets.chomp
  #   if input == "true"
  #     @player_correct << true
  #   elsif input == "false"
  #     @player_correct << false
  #   end
  #
  #   print "Add computer answer: "
  #   input = gets.chomp
  #   if input == "true"
  #     @computer_correct << true
  #   elsif input == "false"
  #     @computer_correct << false
  #   end
  #   set_position
  #   animation
  #   # puts @computer_correct
  #   # puts @player_correct
  # end
end
