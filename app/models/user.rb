class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password
  #validate some of the attributes of our user by writing code that
  #makes sure no one can sign up without inputting their name, email, and password
end