require './lib/product'

describe 'Product' do
  it 'Product to_s should return Quantity, Name and Total Price' do
    expect(Product.new(1, 'Book', 10).to_s).to eq '1, Book, 10.00'
  end

  it 'Product tax validation' do
    expect(Product.new(1, 'Drink', 10).tax).to eq 1
  end

  it 'Product tax round_up_to_nearest_5_cents validation' do
    expect(Product.new(1, 'imported bottle of drink', 99.25).total_tax).to eq 14.9
  end

  it 'One product total_tax validation' do
    expect(Product.new(1, 'Drink', 10).total_tax).to eq 1
  end

  it 'One product total_price validation' do
    expect(Product.new(1, 'Drink', 10).total_price).to eq 11.0
  end

  it 'Multiple Products total_tax validation' do
    expect(Product.new(3, 'Drink', 10).total_tax).to eq 3
  end

  it 'Multiple Products total_price validation' do
    expect(Product.new(3, 'Drink', 10).total_price).to eq 33.0
  end

end
