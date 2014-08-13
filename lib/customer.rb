class Customer < ActiveRecord::Base
  has_many :visits
  has_many :cashiers, through: :visits
  has_many :purchases, through: :visits
end
