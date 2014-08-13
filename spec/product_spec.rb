require 'spec_helper'

describe Product do
  it "has many purchases" do
    product = Product.create({name: "bananas", price: 1.5 })
    purchase = Purchase.create({product_id: product.id, quantity: 2})
    purchase2 = Purchase.create({product_id: product.id, quantity: 1})
    expect(product.purchases).to eq [purchase, purchase2]
  end
end
