require './lib/core_extensions/float'
require './lib/tax_rate'

class Product

  def initialize(quantity, name, price)
    @quantity, @name, @price = quantity, name, price
  end

  def total_tax
    @quantity * tax
  end

  def total_price
    @quantity * (@price + tax)
  end

  def to_s
    [@quantity, @name, '%.2f' % total_price.to_f.round2].join(', ')
  end

  def tax
    (@price * TaxRate.product_tax(@name)).to_f.round_up_to_nearest_5_cents
  end
end
