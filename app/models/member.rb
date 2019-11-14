class Member < ApplicationRecord
  has_one_attached :image

  validates :first_name, presence: true
  validates :last_name, presence: true
end
