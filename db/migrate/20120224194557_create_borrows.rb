class CreateBorrows < ActiveRecord::Migration
  def self.up
    create_table :borrows do |t|
    	t.integer "user_id", :null=>false
    	t.string "receiver", :null=>false
    	t.integer "amount", :null=>false
    	t.integer "interest"
        t.boolean "paid", :default=>false
        t.date "duedate"
    	t.timestamps
    end
    add_index("borrows","user_id")
    add_index("borrows","paid")
  end
  
  def self.down
  	drop_table :borrows
  end
end
