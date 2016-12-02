class Image < ApplicationRecord
  belongs_to :product
  validates :link, presence: true
  validates :product_id, presence: true
end
