class RemoveImagefileFromImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :image_file
  end
end
