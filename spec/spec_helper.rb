require 'active_record'
require 'rspec'
require 'cashier'
require 'product'
require 'purchase'
require 'customer'
require 'visit'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Purchase.all.each { |purchase| purchase.destroy }
    Product.all.each { |product| product.destroy }
    Customer.all.each { |customer| customer.destroy }
    Visit.all.each { |visit| visit.destroy }
  end
end
