class CreateUser < ActiveRecord::Migration 
    def change 
        create_table :users do |t|
            t.string :name
            t.string :email
            t.string :password 
        end 
    end 
end 



# Write a migration that creates a Users table with columns for name, email, and password.