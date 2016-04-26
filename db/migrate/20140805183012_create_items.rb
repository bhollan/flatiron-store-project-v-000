class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :title
      t.text    :description
      t.integer :inventory
      t.decimal :price, precision: 8, scale: 2
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
