# require CSV class and terminal table gem
require 'csv'
require 'terminal-table'

# create HighScore class
class HighScore

  # set attribute accessors
  attr_accessor :name

  # initialize method
  def initialize
    @name = []
  end

  # method to save current game's score into a CSV file
  def save(filename, player, score)
    CSV.open(filename, "ab") do |csv|
      csv << [player, score]
    end
  end

  # method to read all contents of CSV file
  def read(filenames)
    CSV.foreach(filenames) do |row|
      @name << [row[0],row[1]]
    end
    # display method
    display
  end

  # method to display the contents of CSV file ordered by highest scores in a table
  def display
   rows = @name.sort_by {|x, y| y}.reverse
   table = Terminal::Table.new :title => "High Scores", :headings => ['Player', 'Score'], :rows => rows[0..3]
   puts table
  end

end
