class Jersey < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  attribute :created_by_ai, :boolean, default: false
end
