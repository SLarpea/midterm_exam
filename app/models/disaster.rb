class Disaster < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :information, presence: true
  paginates_per 5
end