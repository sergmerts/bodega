require 'active_record'
require 'rspec'
require 'product'
require 'purchase'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Purchase.all.each { |purchase| purchase.destroy }
    Product.all.each { |product| product.destroy }
  end
end
