class Borrow < ActiveRecord::Base
	belongs_to :user
	
	validates_presence_of :amount, :message=>" cannot be empty"				 
	validates_presence_of :receiver, :message=>' name must be filled'
	validates_length_of :amount, :maximum=>10, :message => ' is maximum 10 digits'
	validates_length_of :interest, :maximum=>3, :message => ' is maximum 3 digits'
	validates_numericality_of :amount
	validates_numericality_of :interest
end
