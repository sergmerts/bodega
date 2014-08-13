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

  def self.total_by_date(start_date,end_date)
    self.where("date > '#{start_date}' AND < date '#{end_date}'").each do |visit|
      total = 0
      total = total + visit.total
    end
  end
end
