# create Players class
class Players
  def initialize
    @name = name
    @score = 0
  end

  # set attributor accessors
  attr_accessor :name, :score

  # method to set up player name from user input
  def set_name
    print "Please type in your name: "
    @name = gets.chomp
  end

  # method to increase player score by 10
  def increase_score
    @score = @score + 10
  end
end
