require_relative "questions"
require_relative "computer"
require_relative "players"

player_1 = Players.new
player_1.set_name
questions_master = Questions.new
bob = Computer.new("bob")
questions_master.ask_questions(bob, player_1)

puts "here are your anser #{questions_master.answers}"
puts "#{player_1.name}, Your score is #{player_1.score}"
puts "....and the computer score is #{bob.score}"
