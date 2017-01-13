class Category < ApplicationRecord
  has_many :product_groups
  has_many :products, through: :product_groups
  validates :title, presence: true, uniqueness: true
end
