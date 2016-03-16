class AddUserConstraints < ActiveRecord::Migration
  def up
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :uid, unique: true
  end

  def down
    remove_index :users, :username, :string
    remove_index :users, :email, :string
    remove_index :users, :uid, :string
  end
end
