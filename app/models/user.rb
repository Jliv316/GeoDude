class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password

  enum role: [:default, :admin]

  has_many :points
  has_many :user_routes
  has_many :routes, through: :user_routes

  def get_points_by_company
    company_names = Hash.new(0)
    points_array = generate_points
    points_array.each do |point|
      company_names[point.company.name] += 10
    end
    return company_names
  end

  def generate_points
    points_array = []
    company_ids = get_company_ids
    company_ids.each do |company_id|
      points_array << points.create(company_id: company_id)
    end
    return points_array
  end

  def get_company_ids
    company_ids = []
    routes.each do |route|
      route.companies.each do |company|
          company_ids << company.id
      end
    end
    return company_ids
  end
end