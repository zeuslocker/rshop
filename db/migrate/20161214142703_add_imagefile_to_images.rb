class AddImagefileToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :image_file, :string
  end
end
