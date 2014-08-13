require 'spec_helper'

describe Visit do
  describe "total" do
    it "returns the total sale amount for a visit" do
      larry = Cashier.create({name: "Larry"})
      customer = Customer.create({name: "Michael"})
      morning = Visit.create({customer_id: customer.id, cashier_id: larry.id, date: Date.today})
      product = Product.create({name: 'banana', price: 1.5})
      product2 = Product.create({name: 'apples', price: 3})
      purchase = Purchase.create({product_id: product.id, quantity: 2, visit_id: morning.id })
      purchase = Purchase.create({product_id: product2.id, quantity: 5, visit_id: morning.id })
      expect(morning.total).to eq 18
    end
  end
end
