class Category < ApplicationRecord
  has_many :disasters, dependent: :destroy
  validates :title, presence: true
  validates :information, presence: true
end