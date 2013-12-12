class CreateUserFriendships < ActiveRecord::Migration
  def change
    create_table :user_friendships do |t|
    	t.integer :friend_id
    	t.integer :user_id

		t.timestamps
    end

    add_index :user_friendships, [:user_id, :friend_id]
  end


end
