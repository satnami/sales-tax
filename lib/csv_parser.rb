require 'csv'
require './lib/product'

class CSVParser
  def self.parse(string)
    data = CSV.parse(string, col_sep: ', ', converters: :numeric)
    data.shift # header!
    data.map! { |row| Product.new *row }
  end

  def self.write(lines)
    CSV.open('./output.csv', 'wb') do |csv|
      lines.each do |line|
        csv << line
      end
    end
  end
end
