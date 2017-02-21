require_relative "questions"
require_relative "computer"
require_relative "players"

#method to get the game
def set_info
  print "Please type in your name: "
  return name = gets.chomp
end
#clear the screen
def clear_screen
  system("clear")
end



clear_screen
#Starting the game
current_player = Players.new
current_player.set_name #storing the the player information

clear_screen
#creating new player
puts "Welcome #{current_player.name} "
puts ""
puts "Press Enter to continue"
gets.chomp
system("clear")

#creating new question lists
questions_list = Questions.new
#getting the questions from the file
questions_list.getting_questions("questions.txt")
current_opponent = Computer.new("bob")
questions_list.ask_questions(current_opponent, current_player)

puts "here are your anser #{questions_list.answers}"
puts "#{current_player.name}, Your score is #{current_player.score}"
puts "....and the computer score is #{current_opponent.score}"
