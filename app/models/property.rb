class Property < ApplicationRecord
  belongs_to :product
  validates :name, presence: true
  validates :value, presence: true
  validates :title, presence: true
end
