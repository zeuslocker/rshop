class Property < ApplicationRecord
  validates :name, presence: true
  validates :values, presence: true
end
