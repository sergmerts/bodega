require 'spec_helper'

describe Purchase do
  it "belongs to a product" do
    product = Product.create({name: "bananas", price: 1.5 })
    purchase = Purchase.create({product_id: product.id, quantity: 2})
    expect(purchase.product).to eq product
  end
end

