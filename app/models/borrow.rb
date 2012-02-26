class Borrow < ActiveRecord::Base
	belongs_to :user
	
	validates_presence_of :amount, :message=>" cannot be empty"				 
	validates_presence_of :receiver, :message=>' name must be filled'
end
