class Fact < ApplicationRecord
  validates :number, presence: true
  validates :title, presence: true
end
