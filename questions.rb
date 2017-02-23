# create Questions class
class Questions
  # initialize method
  def initialize
    @questions = []
    @answers = []
    @player_correct = [] # store whether player got the previous answer correct or not
    @computer_correct = [] # store whether computer got the previous answer correct or not
    @hashed_ans = Hash.new
    @player = "\u{1f988}" # emoji for the player character
    @computer = "\u{1f693}" # emoji for the computer character
    @start = "\u{1f3e6}" # emoji for the starting point
    @goal = "\u{1f681}" # emoji for the final destination
    @player_pos = [40] # position of player in the level string
    @computer_pos = [50] # position of computer in the level string
    @level1_string = " " * 2 + @goal + " " * 49 + @start # string which displays progression of player and computer
  end

  # set up attributor accessors
  attr_accessor :hashed_ans, :questions, :answers ,:options, :player_correct, :computer_correct, :player, :computer, :player_pos, :computer_pos, :player_correct, :computer_correct, :level1_string

  # method to obtain the questions from a CSV file
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

  # method which asks questions and displays animation
  def ask_questions(opponent, person)
    x = 0
    set_position
    # set a way to exit the nested loop
    catch :exit do
      # loops questions until catch
      loop do
        # display animation
        set_position
        animation
        # [0..4] shows the first five items of the every question array
        current_questions = Array.new(@questions[x])
        attc_value(current_questions)
        puts current_questions[0..4]
        # store the right answer
        right_answer = current_questions.last.to_s
        right_answer = right_answer.delete("\n")
        # ask the player questions and get the result
        puts "\nSelect your answer:"
        system ("say Select your answer.")
        get_answer = gets.chomp.upcase
        # store the value of the answer
        player_answer = @hashed_ans[get_answer]
        # call the result method for the player
        boolean_answers_person(person, get_answer, right_answer, player_answer)
        # obtain the result of the computer
        com_answer = opponent.assign_prob(right_answer)
        com_display = @hashed_ans[com_answer]
        # call the result method for the computer
        boolean_answers_computer(opponent, com_answer, right_answer, com_display)
        #put the answer into the answer array
        @answers << player_answer
        x += 1
        puts "\nPress Enter to continue"
        gets.chomp
        system("clear")
      end
    end
  end

  # a method to decide if the player answered correctly
  def boolean_answers_person(player, player_result, right_result, dsp_result)
    # condition matching the player result with right result
    if player_result == right_result
      system("clear")
      view_current
      puts "You picked: \n#{dsp_result}"
      puts Paint["Woo! Correct!" + " \u{2705}" + "  " + "\u{1f600}", :green]
      system ("say yay")
      player.increase_score
      @player_correct << true
    else
      system("clear")
      view_current
      puts "You picked: \n#{dsp_result}"
      puts Paint["Fail bro." + " \u{274c}" + "  " + "\u{1f625}", :red]
      system ("say damn")
      @player_correct << false
    end
  end

  # a method to display if the computer produceed the right answer
  def boolean_answers_computer(computer, com_result, right_result, display_rst)
    if com_result == right_result
      puts "\n#{computer.name} selected: "
      $stdout.flush
      sleep(1.5)
      puts "#{display_rst}"
      puts Paint["#{computer.name} is catching up!" + " \u{2705}" + "  " + "\u{1f600}", :green]
      computer.increase_score
      @computer_correct << true
    else
      puts "\n#{computer.name} selected: "
      $stdout.flush
      # sleep(1.5)
      puts "#{display_rst}"
      puts Paint["#{computer.name} is falling behind, hurry RUN faster!" + " \u{274c}" + "  " + "\u{1f625}", :red]
      @computer_correct << false
    end
  end

  # set position of player for animation string
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

  # display the current player/computer progression animation
  def view_current
    system('clear')
    @level1_string[@player_pos[-1]] = @player
    @level1_string[@player_pos[-1]+1] = "\u{1f4b0}"
    @level1_string[@computer_pos[-1]] = @computer
    insert_sky
    puts @level1_string
    insert_landscape
  end

  # method for the starting animation
  def starting_animation
    x = 49
    string = " " * 2 + @goal + " " * 46 + @player + "\u{1f4b0} " + @start
    9.times do
      system('clear')
      insert_sky
      string[x-1] = @player
      string[x] = "\u{1f4b0}"
      string[x+1] = " "
      string[x+2] = " "
      puts string
      insert_landscape
      x -= 1
      sleep 0.1
    end
  end

  # method for the main animation
  def animation
    x = -1
    y = -1
    a = -1
    b = -1
    player_movement = (@player_pos[-2] - @player_pos[-1]) / 5
    computer_movement = (@computer_pos[-2] - @computer_pos[-1]) / 5
    player_movement2 = (@player_pos[-2] - @player_pos[-1]) / 3
    computer_movement2 = (@computer_pos[-2] - @computer_pos[-1]) / 3
    # run only if the player wins the game
    if @player_pos[-1] == 0
      3.times do
        system('clear')
        if player_movement == 1
          @level1_string[@player_pos[-2] + player_movement2 * a + 1] = "\u{1f4b0}"
          @level1_string[@player_pos[-2] + player_movement2 * a + 2] = " "
          @level1_string[@player_pos[-2] + player_movement2 * a + 3] = " "
          @level1_string[@player_pos[-2] + player_movement2 * a] = @player
          @level1_string[2] = @goal
          @level1_string[52] = @start
        end
        if computer_movement == 1
          @level1_string[@computer_pos[-2] + computer_movement2 * b + 1] = " "
          @level1_string[@computer_pos[-2] + computer_movement2 * b + 2] = "\u{1f4a8}"
          @level1_string[@computer_pos[-2] + computer_movement2 * b + 3] = " "
          @level1_string[@computer_pos[-2] + computer_movement2 * b] = @computer
          @level1_string[2] = @goal
          @level1_string[52] = @start
        end
        insert_sky
        puts @level1_string
        insert_landscape
        a -= 1
        b -= 1
        sleep 0.07
      end
      system('clear')
      @computer_pos[-1] = "\u{1f4a5}"
      @player_pos[-1] = @goal
      insert_sky
      puts @level1_string
      insert_landscape
      system ("say Congratulations! You have successfully escaped with the cash!")
      sleep 2
      str = ""
      700.times do
        system('clear')
        str += "\u{1f4b0} "
        puts str
        sleep 0.005
      end
      throw :exit
    end
    # move the player/computer 5 blocks for each correct answer
    5.times do
      system('clear')
      if player_movement == 1
        @level1_string[@player_pos[-2] + player_movement * x + 1] = "\u{1f4b0}"
        @level1_string[@player_pos[-2] + player_movement * x + 2] = " "
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
      x -= 1
      y -= 1
      sleep 0.07
    end
    @level1_string[@computer_pos[-2] + computer_movement * y + 3] = " "
    # run only if player loses to computer
    if @player_pos[-1] == @computer_pos[-1]
      explosion_animation
      system ("say Boom Boom Boom")
      sleep 2
      str = ""
      700.times do
        system('clear')
        str += "\u{2620} "
        puts str
        sleep 0.005
      end
      throw :exit
    else
      system('clear')
      insert_sky
      @level1_string[52] = @start
      puts @level1_string
      insert_landscape
    end
  end

  # method for displaying the computer crashing into player
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

  # method to display the landscape
  def insert_landscape
    puts ("\u{1f4b5}" + " " + "\u{1f4b4}" +  " " + "\u{1f4b6}" +  " " + "\u{1f4b7}" +  " ") * 8 # line of cash?
  end

  # method to display the sky
  def insert_sky
    puts " " * 41 + "\u{2728} " + "\u{1f31b}" + " \u{2728}"
    puts
  end
end
