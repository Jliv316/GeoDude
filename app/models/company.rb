class Company < ApplicationRecord
  validates_presence_of :name, :street, :city, :state, :zip, require: true
end