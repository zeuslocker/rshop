# frozen_string_literal: true
class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |f|
      f.string :name
      f.string :value
      f.string :title
      f.references :propertible, polymorphic: true, index: true
      f.timestamps
    end
  end
end
