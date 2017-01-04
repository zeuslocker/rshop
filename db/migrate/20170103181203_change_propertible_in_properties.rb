# frozen_string_literal: true
class ChangePropertibleInProperties < ActiveRecord::Migration
  def change
    remove_reference :properties, :propertible, polymorphic: true
    add_reference :properties, :product, foreign_key: true
  end
end
