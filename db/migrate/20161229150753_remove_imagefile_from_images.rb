# frozen_string_literal: true
class RemoveImagefileFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :image_file, :string
  end
end
