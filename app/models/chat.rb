class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :jersey
  has_many :messages, dependent: :destroy
end
