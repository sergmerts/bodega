class Visit < ActiveRecord::Base
  belongs_to :customer
  belongs_to :cashier
  has_many :products, through: :purchases
  has_many :purchases

  def total
    visit_total = 0
    purchases.each do |purchase|
      product = Product.where({id: purchase.product_id}).first
      purchase_total = purchase.quantity * product.price
      visit_total = visit_total.to_f + purchase_total.to_f
    end
    visit_total
  end
end
