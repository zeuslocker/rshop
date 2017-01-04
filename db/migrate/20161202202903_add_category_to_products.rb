# frozen_string_literal: true
class AddCategoryToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :category, foreign_key: true
  end
end
