class ChangeRingedUpColumnToLogedIn < ActiveRecord::Migration
  def change
    rename_column :cashiers, :ringed_up, :loged_in
  end
end
