require 'active_record'
require './lib/product'
require './lib/cashier'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to the S & N Bodega"
  choice = nil
  until choice == '0'
    puts "1: Manager Log in"
    choice = gets.chomp
    case choice
    when '1' then manager_menu
    when '0' then exit
    else
      puts "Not a valid option."
    end
  end
end

def manager_menu
  choice = nil
  until choice == '0'
    puts "1: Add product"
    puts "2: List products"
    puts "3: Add Cashier"
    puts "0: Leave the store"
    choice = gets.chomp
    case choice
    when '1' then add_product
    when '2' then list_products
    when '3' then add_cashier
    when '0' then exit
    else
      puts "Not a valid option."
    end
  end
end

def add_product
  puts "Enter a product name:"
  name = gets.chomp
  puts "Enter the price of a #{name}:"
  price = gets.chomp
  new_product = Product.create({name: name, price: price})
  puts "#{new_product.name} added!"
end

def list_products
  puts "Product Inventory:"
  Product.all.each_with_index do |product, i|
    puts "#{i + 1}. #{product.name}: $#{product.price}"
  end
end

def add_cashier
  puts "Enter a cashier name:"
  name = gets.chomp
  new_cashier = Cashier.create({name: name, loged_in: false})
  puts "#{new_cashier.name} added!"
end

welcome
