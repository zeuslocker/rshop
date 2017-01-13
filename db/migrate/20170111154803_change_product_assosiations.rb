class ChangeProductAssosiations < ActiveRecord::Migration
  def change
    remove_reference :products, :category
    add_reference :products, :product_group, foreign_key: true

  end
end
