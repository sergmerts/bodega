class ChangeQuanityToQuantity < ActiveRecord::Migration
  def change
    rename_column :purchases, :quanity, :quantity
  end
end
