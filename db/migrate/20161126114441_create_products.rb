# frozen_string_literal: true
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :category
      t.string :subcategory
      t.timestamps
    end
end
end
