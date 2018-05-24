class Route < ApplicationRecord
  validates_presence_of :start, :finish, require: true
  has_many :companies
  has_many :user_routes
  has_many :users, through: :user_routes
end