class Product < ApplicationRecord
  attr_accessor :images_links
  has_many :images, :dependent => :destroy
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {in: 2..40}
  validates :description, presence: true, length: {minimum: 2}
  validates :price, presence: true
 
end
