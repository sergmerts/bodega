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
    puts "2: Cashier Log in"
    puts "3: Customer Log in"
    choice = gets.chomp
    case choice
    when '1' then manager_menu
    when '2' then cashier_login
    when '3' then customer_menu
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
    puts "3: Add cashier"
    puts "4: List cashiers"
    puts "0: Leave the store"
    choice = gets.chomp
    case choice
    when '1' then add_product
    when '2' then list_products
    when '3' then add_cashier
    when '4' then list_cashiers
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
  puts "\n\n"
end

def list_products
  puts "Product Inventory:"
  Product.all.each_with_index do |product, i|
    puts "#{i + 1}. #{product.name}: $#{product.price}"
  end
  puts "\n\n"
end

def add_cashier
  puts "Enter a cashier name:"
  name = gets.chomp
  new_cashier = Cashier.create({name: name, loged_in: false})
  puts "#{new_cashier.name} added!"
  puts "\n\n"
end

def list_cashiers
  puts "Cashiers: "
  Cashier.all.each_with_index do |cashier, i|
    puts "#{i + 1}. #{cashier.name}"
  end
  puts "\n\n"
end

@current_cashier

def cashier_login
  puts "Enter your name to log in:"
  name = gets.chomp
  @current_cashier = Cashier.find_by({name: name})
  if @current_cashier == nil
    puts "#{name} doesn't work here!"
  else
    @current_cashier.update({loged_in: true})
    puts "Welcome, #{@current_cashier.name}. Start working."
    cashier_menu
  end
end

def log_out
  @current_cashier.update({loged_in: false})
  puts "#{@current_cashier.name} logged out."
  welcome
end

def cashier_menu
  choice = nil
  until choice == '0'
    puts "1: New visit"
    puts "9: Log out"
    puts "0: Leave the store"
    choice = gets.chomp
    case choice
    when '1' then new_purchase
    when '9' then log_out
    when '0' then exit
    else
      puts "Not a valid option."
    end
  end
end

def customer_menu
  choice = nil
  until choice == '0'
    puts "1: New shopping cart"
    puts "0: Leave the store"
    choice = gets.chomp
    case choice
    when '1' then new_purchase
    when '9' then log_out
    when '0' then exit
    else
      puts "Not a valid option."
    end
  end
end

@current_purchase

def new_purchase
  @current_purchase = Purchase.create()
  add_item

end

def add_item
  list_products
  print "Choose a product: "; product_name = gets.chomp
  product_id = Product.find_by({name: product_name})
  print "Choose quanity: "; quanity = gets.chomp.to_i
  @current_purchase.update({product_id: product_id, quanity: quanity})
end

welcome
