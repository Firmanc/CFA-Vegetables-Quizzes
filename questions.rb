class Questions
  def initialize(questions)
    @questions = questions
  end

  attr_accessor :questions

# method which asks questions...
  def ask_questions
    # saves the answers inside an array
    @answers = []

    @questions.each do |question|
      #[0..4] shows the first five items of the 1st array
      puts question[0..4]
      #storing the
      @x = question[5]

      puts "What do you choose? Select from A, B, C or D"
      @answer = gets.chomp.upcase
      boolean_answers
      @answers << @answer
      puts @answers.inspect
    end
end

  def boolean_answers
    if @answer == @x
      puts "You got it right!"
      puts "Press Enter to continue"
      gets.chomp
      system("clear")
    else
      puts "You got that wrong!"
      puts "Press Enter to continue"
      gets.chomp
      system("clear")
    end
  end

end

question_list = [
["Where is Honolu?", "A", "B", "C", "D", "A"],
["What Vegie is the best?", "A", "B", "C", "D", "B"],
["Carrot has calcium?", "A", "B", "C", "D", "C"],
]

questions_master = Questions.new(question_list)

questions_master.ask_questions

puts @answers.inspect
