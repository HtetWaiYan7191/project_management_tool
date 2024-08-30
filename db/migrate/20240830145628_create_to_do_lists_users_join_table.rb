class CreateToDoListsUsersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :to_do_lists, :users do |t|
      t.index :to_do_list_id 
      t.index :user_id
    end
  end
end
