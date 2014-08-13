class CreatesCashiers < ActiveRecord::Migration
  def change
    create_table :cashiers do |t|
      t.column :name, :string
      t.column :ringed_up, :boolean

      t.timestamps
    end
  end
end
