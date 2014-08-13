class Cashier < ActiveRecord::Base
  has_many :customers, through: :visits
end
