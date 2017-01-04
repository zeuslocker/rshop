# frozen_string_literal: true
class Comment < ApplicationRecord
  belongs_to :product
  validates :commenter, presence: true
  validates :body, presence: true, length: { in: 1..200 }
end
