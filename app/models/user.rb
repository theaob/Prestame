class User < ActiveRecord::Base
	  has_many :authentications
	  has_many :borrows
end
