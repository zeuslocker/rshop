# frozen_string_literal: true
class Product < ApplicationRecord
  attr_accessor :images_links, :category_type, :property_data
  has_many :images, dependent: :destroy, autosave: true
  has_many :comments, dependent: :destroy
  has_many :properties, dependent: :destroy, autosave: true
  belongs_to :category
  validates_associated :images, :properties
  validates :title, presence: true, length: { in: 2..100 }
  validates :description, presence: true, length: { minimum: 2 }
  validates :price, presence: true
end
