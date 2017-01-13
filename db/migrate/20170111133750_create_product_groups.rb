class CreateProductGroups < ActiveRecord::Migration
  def change
    create_table :product_groups do |t|
      t.references :category, foreign_key: true
      t.timestamps null: false
    end
  end
end
