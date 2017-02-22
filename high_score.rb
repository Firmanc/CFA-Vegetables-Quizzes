require 'csv'

class HighScore

  def initialize
    @name = {}
  end

  def save_list(filename, player, score)
    CSV.open(filename, "ab") do |csv|
      csv << [player, score]
    end


  end

  def display_list(filename)

  end

end
