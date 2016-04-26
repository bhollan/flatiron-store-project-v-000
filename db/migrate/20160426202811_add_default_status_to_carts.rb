class AddDefaultStatusToCarts < ActiveRecord::Migration
  def change
    change_column :carts, :status, :integer, default: 0
  end
end
