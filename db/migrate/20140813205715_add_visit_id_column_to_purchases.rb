class AddVisitIdColumnToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :visit_id, :integer
  end
end
