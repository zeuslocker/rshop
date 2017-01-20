class AddShowCaseToProduct < ActiveRecord::Migration
  def change
    add_column :products, :show_case, :text
  end
end
