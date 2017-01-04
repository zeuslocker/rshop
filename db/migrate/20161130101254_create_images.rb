# frozen_string_literal: true
class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :link
      t.references :product, foreign_key: true
      t.timestamps
    end
 end
end
