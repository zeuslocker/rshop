# frozen_string_literal: true
class AddImagefileToImages < ActiveRecord::Migration
  def change
    add_column :images, :image_file, :string
  end
end
