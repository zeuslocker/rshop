# frozen_string_literal: true
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |f|
      f.string :commenter
      f.text :body
      f.references :product, foreign_key: true
      f.timestamps
    end
  end
end
