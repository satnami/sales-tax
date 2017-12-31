module TaxRate
  # TODO move to yml
  SALES_TAX = 0.1
  IMPORT_TAX = 0.05
  IMPORTED_PRODUCTS = 'imported'
  EXEMPT_PRODUCTS = %w(food book medical chocolate pills)

  module_function

  # TODO split the tax rate into strategies
  def product_tax(product)
    tax = 0
    tax += IMPORT_TAX if product =~ Regexp.new(IMPORTED_PRODUCTS)
    tax += SALES_TAX unless EXEMPT_PRODUCTS.any? { |p| product.downcase.include?(p) }
    tax
  end
end
