# import all required gems and files
require 'test/unit'
require 'csv'
require 'terminal-table'
require_relative "questions"
require_relative "computer"
require_relative "players"
require_relative "high_score"

# test Players class
class PlayersTest < Test::Unit::TestCase
  # test that score value on initiating a new player is 0
  def test_player_starting_score
    player_1 = Players.new
    actual = player_1.score
    expected = 0
    msg = "The value should be 0"
    assert_equal(expected, actual, msg)
  end

  # test that the increase_score function correctly increments score
  def test_player_increase_score
    player_2 = Players.new
    actual = player_2.increase_score
    expected = 10
    msg = "The value should be 10"
    assert_equal(expected, actual, msg)
  end
end

# test Computer class
class ComputerTest < Test::Unit::TestCase
  # test that name of computer gets initiated correctly
  def test_comp_name
    comp_1 = Computer.new("Bob")
    actual = comp_1.name
    expected = "Bob"
    msg = "The name should be \"Bob\""
    assert_equal(expected, actual, msg)
  end

  # test that the increase_score function correctly increments score
  def test_increase_score
    comp_2 = Players.new
    actual = comp_2.increase_score
    expected = 10
    msg = "The value should be 10"
    assert_equal(expected, actual, msg)
  end
end

# test HighScore class
class HighScoreTest < Test::Unit::TestCase
  # test that initiating a score list creates an empty array attribute
  def test_name
    score_list_1 = HighScore.new
    actual = score_list_1.name
    expected = []
    msg = "This should be an empty array"
    assert_equal(expected, actual, msg)
  end

  # test that the method reads the CSV file and puts it into the empty array correctly
  def test_file_read
    score_list_2 = HighScore.new
    score_list_2.read("test_score.csv")
    actual = score_list_2.name
    expected = [["Shane", "20"]]
    msg = "This should be an array containing the strings Shane and 20"
    assert_equal(expected, actual, msg)
  end
end

# test the Questions class
class QuestionTest < Test::Unit::TestCase
  # test that the method reads all the questions correctly from the file
  def test_getting_questions
    question_list_1 = Questions.new
    question_list_1.getting_questions("test_score_1.csv")
    actual = question_list_1.questions
    expected = [["Shane", "a", "b", "c", "d", "e"]]
    msg = "This should be an array containing the strings Shane, a, b, c, d and e"
    assert_equal(expected, actual, msg)
  end

  # test that the answers get stored correctly from an array
  def test_attc_value
    question_list_2 = Questions.new
    ary = ["Shane", "a", "b", "c", "d", "e"]
    question_list_2.attc_value(ary)
    actual = question_list_2.hashed_ans
    expected = {"A" => 'a',"B" => 'b',"C" => 'c',"D" => 'd'}
    msg = "This should be a hash with the values, A, a, B, b, C, c, D, d"
    assert_equal(expected, actual, msg)
  end
end
