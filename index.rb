# require all the relatives files and gem
require_relative "questions"
require_relative "computer"
require_relative "players"
require_relative "high_score"
require "paint"

# method to clear the screen
def clear_screen
  system("clear")
end

# method for introduction to game
def next_page
  puts ""
  puts ""
  puts "Sh...quick and quiet. Don't let them catch you taking the money..."
  system ("say Shoo. quick and quiet. Do not let them catch you taking the money...")
  sleep 1.5
  puts ""
  puts ""
  puts "      \u{1f440}" * 5
  sleep 1.5
  puts ""
  puts ""
  puts " " * 30 + "#@$%! footsteps!"
  system ("say BEEP... footsteps...")
  sleep 1.5
  puts ""
  puts ""
  puts " " * 30 + "RUN!"
  system ("say RUN!")
  sleep 1.5
  system("clear")
end

# clear screen once user selects the ruby file
clear_screen

# show the title screen
puts Paint[%q{

                   .___.  .  .  .  .  .__
                     |    |__|  |  |  [ __
                     |    |  |  |__|  [_./

                   .     .   ,  .___  .___
                   |      \./   [__   [__
                   |___    |    |     [___

                     _,    _,    _,    _,
                    '_)   |.|   |.|   |.|
                    /_.   |_|   |_|   |_| }, :red]

system ("say THUG LIFE 2000")
      sleep 3.5
clear_screen

# create new player
current_player = Players.new
puts "\n\n"
current_player.set_name #get user to set player name
clear_screen
# creating new player
puts "\n\nWelcome #{current_player.name}."
system ("say Welcome '#{current_player.name}'")
sleep 2
next_page

# create new question lists
questions_list = Questions.new
questions_list.getting_questions("questions.csv")
# create new computer opponent
current_opponent = Computer.new("Po-Po")
# run the main code/loop of the game
questions_list.starting_animation
questions_list.view_current
questions_list.ask_questions(current_opponent, current_player)
# clear screen once loop has exited
clear_screen
# enter the ending screen
puts "\n#{current_player.name}, your score is #{current_player.score}"
score_list = HighScore.new
# store the score in the record
score_list.save("high_score.csv", current_player.name, current_player.score)
if questions_list.player_pos[-1] == questions_list.computer_pos[-1]
  puts Paint["You have been caught by the police. Too bad you will be going to jail now...\n\n", :red]
else
  puts Paint["Congratulations! You have successfully escaped with the cash!\n\n", :green]
end
# display the highscore table
score_list.read("high_score.csv")
