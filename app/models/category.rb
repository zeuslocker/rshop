# frozen_string_literal: true
class Category < ApplicationRecord
  has_many :products
  validates :title, presence: true, uniqueness: true
end
