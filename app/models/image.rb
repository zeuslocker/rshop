require 'uri'
class Image < ApplicationRecord
  belongs_to :product
   validates :link, presence: true#, format: { with: URI.regexp }
  # validates :link, format: { with: URI.regexp }
#  validates :product_id, presence: true
end
