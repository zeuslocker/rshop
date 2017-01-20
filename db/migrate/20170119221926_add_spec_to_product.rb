class AddSpecToProduct < ActiveRecord::Migration
  def change
    add_column :products, :spec, :text
  end
end
