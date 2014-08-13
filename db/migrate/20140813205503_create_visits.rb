class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.column :customer_id, :integer
      t.column :cashier_id, :integer

      t.timestamps
    end
  end
end
