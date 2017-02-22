require 'csv'
require 'terminal-table'

class HighScore

  def initialize
    @name = []
  end

  def save(filename, player, score)

    CSV.open(filename, "ab") do |csv|
      csv << [player, score]
    end
  end

  def read(filename)
    CSV.foreach(filename) do |row|
      @name << {}
  end

  def display(filename)
    rows = []
    CSV.foreach(filename) do |row|
      rows << [row[0], row[1]]
    end
    table = Terminal::Table.new :title => "High Scores", :headings => ['Players', 'Score'], :rows => rows
    puts table
    puts rows.inspect
  end

end
