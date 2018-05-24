class AddFinishToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :finish, :string
  end
end
