class Visit < ActiveRecord::Base
  belongs_to :customer
  belongs_to :cashier
  has_many :products, through: :purchases
  has_many :purchases
end
