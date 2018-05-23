class CreateUserRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_routes do |t|
      t.references :route, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
