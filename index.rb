require_relative "questions"
require_relative "computer"
require_relative "players"

question_list = [
["Where is Honolu?", "A", "B", "C", "D", "A"],
["What Vegie is the best?", "A", "B", "C", "D", "B"],
["Carrot has calcium?", "A", "B", "C", "D", "C"],
]

questions_master = Questions.new(question_list)
computer = Computer.new
questions_master.ask_questions(computer)
