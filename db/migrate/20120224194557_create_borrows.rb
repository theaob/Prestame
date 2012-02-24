class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrows do |t|
    	t.integer "giver", :null=>false
    	t.string "receiver", :null=>false
    	t.integer "amount", :null=>false
    	t.integer "interest"
        t.boolean "paid"
        t.date "duedate"
    	t.timestamps
    end
  end
end
