require 'csv'

class CSVReader
  def self.parse(string)
    data = CSV.parse(string, col_sep: ', ', converters: :numeric)
    data.shift # header!
    data.each { |row| puts "#{row}" }
  end
end
