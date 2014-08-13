class AddDateColumnToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :date, :date
  end
end
