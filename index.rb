require_relative "questions"
require_relative "computer"
require_relative "players"
require_relative "high_score"

#method to get the game
def set_info
  system ('say "Please type in your name"')
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

puts "here are your answer #{questions_list.answers}"
puts "#{current_player.name}, Your score is #{current_player.score}"
puts "....and the computer score is #{current_opponent.score}"

#store the score in the record
score_list = HighScore.new
score_list.save("high_score.csv", current_player.name, current_player.score)
#score_list.display("high_score.csv")
score_list.read("high_score.csv")
