class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password

  enum role: [:default, :admin]

  has_many :points
  has_many :user_routes
  has_many :routes, through: :user_routes
end