require './lib/tax_rate'

describe 'TaxRate' do
  it 'Tax for IMPORTED_PRODUCTS should be 0.05' do
    expect(TaxRate.product_tax('imported book').to_f.round2).to eq 0.05
    end

  it 'Tax for EXEMPT_PRODUCTS should be 0' do
    expect(TaxRate.product_tax('back of chocolate').to_f.round2).to eq 0
  end

  it 'Tax for non EXEMPT_PRODUCTS should be 0.1' do
    expect(TaxRate.product_tax('bottle of perfume').to_f.round2).to eq 0.1
  end

  it 'Tax for non EXEMPT_PRODUCTS and IMPORTED_PRODUCTS should be 0.15' do
    expect(TaxRate.product_tax('imported bottle of perfume').to_f.round2).to eq 0.15
  end

  it 'Tax for EXEMPT_PRODUCTS and non IMPORTED_PRODUCTS should be 0.1' do
    expect(TaxRate.product_tax('bottle of perfume').to_f.round2).to eq 0.1
  end
end
