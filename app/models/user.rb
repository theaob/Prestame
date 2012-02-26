class User < ActiveRecord::Base
	  has_many :authentications
	  has_many :borrows
	  
	  validates_presence_of :name,:message=>"cannot be empty"
end
