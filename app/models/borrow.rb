class Borrow < ActiveRecord::Base
	belongs_to :user
	
	validates_presence_of :amount, :message=>"You have to enter an amount"				 
	validates_presence_of :receiver, :message=>'Receiver name must be filled'
end
