class ProductGroup < ApplicationRecord
  belongs_to :category
  has_many :products, dependent: :destroy
  has_many :properties, through: :products, dependent: :destroy
  def find_product(properties:, element:)
    self.products.each do |f|
      count = 0
      f.properties.each do |x|
        if x.name == element.name
          count += 1 if element.title == x.title
        else
          count += 1 if x.title == properties.find_by_name(x.name).title
        end
      end
      return f.id if count == properties.size
    end
    return -1
  end
end
