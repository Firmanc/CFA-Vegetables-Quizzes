require 'test/unit'
require 'csv'
require 'terminal-table'
require_relative "questions"
require_relative "computer"
require_relative "players"
require_relative "high_score"

class PlayersTest < Test::Unit::TestCase

  def test_player_starting_score
    player_1 = Players.new
    actual = player_1.score
    expected = 0
    msg = "this should be 0"
    assert_equal(expected, actual, msg)
  end

  def test_player_increase_score
    player_1 = Players.new
    actual = player_1.increase_score
    expected = 10
    msg = "this should be 10"
    assert_equal(expected, actual, msg)
  end

end

class ComputerTest < Test::Unit::TestCase

  def test_com_name
    com_1 = Computer.new("bob")
    actual = com_1.name
    expected = "bob"


    msg = "A should be bob"
    assert_equal(expected, actual, msg)
  end

  def test_increase_score
    bob = Players.new
    actual = bob.increase_score
    expected = 10
    msg = "this should be 10"
    assert_equal(expected, actual, msg)
  end

end

class HighScoreTest < Test::Unit::TestCase

  def test_name
    score_list = HighScore.new
    actual = score_list.name
    expected = []
    msg = "this should be array"
    assert_equal(expected, actual, msg)
  end

  def test_file
    score_list = HighScore.new
    score_list.read("test_score.csv")
    actual = score_list.name
    expected = [["Shane", "20"]]
    msg = "this should be 20"
    assert_equal(expected, actual, msg)
  end

end

class QuestionTest < Test::Unit::TestCase
  def test_getting_questions
    question_list = Questions.new
    question_list.getting_questions("test_score_1.csv")
    actual = question_list.questions
    expected = [["Shane", "a", "b", "c", "d", "e"]]
    msg = "this should be Shaenabcde"
    assert_equal(expected, actual, msg)

  end

  def test_attc_value
    question_list = Questions.new
    ary = ["Shane", "a", "b", "c", "d", "e"]
    question_list.attc_value(ary)
    actual = question_list.hashed_ans
    expected = {"A" => 'a',"B" => 'b',"C" => 'c',"D" => 'd'}
    msg = "this should be Shaenabcde"
    assert_equal(expected, actual, msg)
  end
end
