class ChangeColumnStreetForRoutes < ActiveRecord::Migration[5.2]
  def change
    rename_column :routes, :street, :start
  end
end
