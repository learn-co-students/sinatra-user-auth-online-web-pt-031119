class UserTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |aspects|
      aspects.string :name
      aspects.string :email
      aspects.string :password
    end
  end
end