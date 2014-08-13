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

  describe "total_by_date" do
    it "counts the total amount of sales for a date range" do
      larry = Cashier.create({name: "Larry"})
      customer = Customer.create({name: "Michael"})
      visit1 = Visit.create({customer_id: customer.id, cashier_id: larry.id, date: '2014-08-05'})
      visit2 = Visit.create({customer_id: customer.id, cashier_id: larry.id, date: '2014-08-10'})
      product = Product.create({name: "bananas", price: 1.5 })
      purchase = Purchase.create({product_id: product.id, quantity: 2, visit_id: visit1.id})
      purchase2 = Purchase.create({product_id: product.id, quantity: 2, visit_id: visit1.id})
      purchase3 = Purchase.create({product_id: product.id, quantity: 2, visit_id: visit2.id})
      purchase4 = Purchase.create({product_id: product.id, quantity: 2, visit_id: visit2.id})
      expect(Visit.total_by_date('2014-08-01', '2014-08-07')).to eq 6
    end
  end
end
