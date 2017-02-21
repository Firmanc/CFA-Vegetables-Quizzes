class Questions
  def initialize(questions)
    @questions = questions
  end

  attr_accessor :questions

# method which asks questions...
  def ask_questions(computer)
    # saves the answers inside an array
    @answers = []

    @questions.each do |question|
      #[0..4] shows the first five items of the 1st array
      puts question[0..4]
      #storing the
      @x = question[5]

      puts "What do you choose? Select from A, B, C or D"
      @answer = gets.chomp.upcase
      boolean_answers_person
      computer.assign_prob(@x)
      boolean_answers_computer
      @answers << @answer
      puts @answers.inspect
    end
end

  def boolean_answers_person
    if @answer == @x
      puts "You got it right!"
    else
      puts "You got that wrong!"
    end
  end

  def boolean_answers_computer
    if @c == @x
      puts "The computer got it right!"
      puts "Press Enter to continue"
      gets.chomp
      system("clear")
    else
      puts "The computer got that wrong!"
      puts "Press Enter to continue"
      gets.chomp
      system("clear")
    end
  end

end
