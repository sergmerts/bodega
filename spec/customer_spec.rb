require 'spec_helper'

describe Customer do
  it 'has many visits' do
    ronnie = Cashier.create({name: "Ronnie"})
    larry = Cashier.create({name: "Larry"})
    customer = Customer.create({name: "Michael"})
    morning = Visit.create({customer_id: customer.id, cashier_id: ronnie.id})
    evening = Visit.create({customer_id: customer.id, cashier_id: larry.id})
    product = Product.create({name: 'banana', price: 1.5})
    product2 = Product.create({name: 'apples', price: 2.78})
    purchase = Purchase.create({product_id: product.id, quantity: 2, visit_id: morning.id })
    purchase2 = Purchase.create({product_id: product2.id, quantity: 5, visit_id: evening.id })
    expect(customer.visits).to eq [morning, evening]
    expect(customer.cashiers).to eq [ronnie, larry]
    expect(customer.purchases).to eq [purchase, purchase2]
  end
end
