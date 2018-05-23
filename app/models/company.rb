class Company < ApplicationRecord
  validates_presence_of :name
  has_many :points
  belongs_to :route
end