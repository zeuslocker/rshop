class Product < ApplicationRecord
  attr_accessor :images_links
  has_many :images, :dependent => :destroy
end
