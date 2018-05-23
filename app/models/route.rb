class Route < ApplicationRecord
  validates :street, uniqueness: true, presence: true
  has_many :companies
  has_many :user_routes
  has_many :users, through: :user_routes
end