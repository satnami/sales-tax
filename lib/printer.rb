require './lib/core_extensions/float'
require './lib/csv_parser'

module Printer
  module_function

  def stdout(output)
    puts output.each(&:to_s)
    puts
    puts "Sales Taxes: #{'%.2f' % output.map(&:tax).reduce(:+).to_f.round2}"
    puts "Total: #{'%.2f' % output.map(&:total_price).reduce(:+).to_f.round2}"
  end

  def csv(output)
    lines = []
    output.each do |item|
      lines << item.to_s.split(', ')
    end
    lines << []
    lines << ["Sales Taxes: #{'%.2f' % output.map(&:tax).reduce(:+).to_f.round2}"]
    lines << ["Total: #{'%.2f' % output.map(&:total_price).reduce(:+).to_f.round2}"]
    CSVParser.write lines
  end
end
