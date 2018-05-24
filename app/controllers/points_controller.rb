class PointsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @points = @user.generate_points
    @points_by_company = @user.get_points_by_company
  end
end