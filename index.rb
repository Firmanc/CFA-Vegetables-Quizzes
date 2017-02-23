require_relative "questions"
require_relative "computer"
require_relative "players"
require_relative "high_score"
require "paint"

#clear the screen
def clear_screen
  system("clear")
end

def next_page
  puts ""
  puts "Sh...quick and quiet. Don't let them catch you taking the money..."
  system ("say quick and quiet. Don't let them catch you taking the money...")
  sleep 3
  puts ""
  puts ""
  puts "      \u{1f440}" * 5
  sleep 3
  puts ""
  puts ""
  puts " " * 30 + "#@$%! footsteps!"
  system ("say F U C K... footsteps...")
  sleep 2
  puts ""
  puts ""
  puts " " * 30 + "RUN!"
  system ("say RUN!")
  sleep 2

  system("clear")
end

clear_screen

puts %q{     .___.  .  .  .  .  .__
       |    |__|  |  |  [ __
       |    |  |  |__|  [_./

     .     .   ,  .___  .___
     |      \./   [__   [__
     |___    |    |     [___

       _,    _,    _,    _,
      '_)   |.|   |.|   |.|
      /_.   |_|   |_|   |_| }

system ("say THUG LIFE 2000")
      sleep 3.5

clear_screen

#Starting the game
#creating new player
current_player = Players.new
current_player.set_name #storing the the player information
clear_screen
#creating new player
puts "Welcome #{current_player.name} "
#system 'say Welcome %x(#{current_player.name})'
system ("say Welcome '#{current_player.name}'")
sleep 2
next_page

#creating new question lists
questions_list = Questions.new
questions_list.getting_questions("questions.csv")
#creating new computer opponet
current_opponent = Computer.new("Po-Po")
questions_list.starting_animation
questions_list.view_current
questions_list.ask_questions(current_opponent, current_player)

#end massage
#puts "here are your answers #{questions_list.answers}"
puts "\n#{current_player.name}, Your score is #{current_player.score}"
puts "the computer score #{current_opponent.score}\n\n"

#store the score in the record
score_list = HighScore.new
score_list.save("high_score.csv", current_player.name, current_player.score)
score_list.read("high_score.csv")
