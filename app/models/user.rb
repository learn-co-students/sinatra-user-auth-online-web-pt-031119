class User < ActiveRecord::Base
  # makes sure no one can sign up without inputting their name, email, and password. 
  validates_presence_of :name, :email, :password



end