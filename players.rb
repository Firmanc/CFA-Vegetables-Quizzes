class Players
  def initialize
    @name = name
    @score = 0
  end

  attr_accessor :name, :score

  #set up player name
  def set_name
    print "Please type in your name: "
    @name = gets.chomp
    #system %x(say 'Welcome #{@name}')
  end

  def increase_score
    @score = @score + 10
  end

  #q_obj is the name of the questions object
  # def set_score(q_obj)
  #   #increase score by 1 if answer was correct for last question
  #   #by reading last value of answers array
  #   if q_obj.answer[-1] == true
  #     @score = @score + 1
  #   end
  # end
end
