require_relative "questions"
require_relative "computer"
require_relative "players"
require_relative "high_score"

#clear the screen
def clear_screen
  system("clear")
end

def next_page
  puts ""
  puts "Press Enter to continue"
  gets.chomp
  system("clear")
end


clear_screen
#Starting the game
#creating new player
current_player = Players.new
current_player.set_name #storing the the player information
clear_screen
#creating new player
puts "Welcome #{current_player.name} "
next_page

#creating new question lists
questions_list = Questions.new
questions_list.getting_questions("questions.txt")
#creating new computer opponet
current_opponent = Computer.new("bob")
questions_list.ask_questions(current_opponent, current_player)

#end massage
#puts "here are your answers #{questions_list.answers}"
puts "\n#{current_player.name}, Your score is #{current_player.score}"
puts "the computer score #{current_opponent.score}\n\n"

#store the score in the record
score_list = HighScore.new
score_list.save("high_score.csv", current_player.name, current_player.score)
score_list.read("high_score.csv")
