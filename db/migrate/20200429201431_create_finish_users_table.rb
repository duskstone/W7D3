class CreateFinishUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :password_digest, :string
    add_column :users, :session_token, :string
    add_index :users, :session_token
    add_index :users, :username
    change_column_null :users, :username, false
    change_column_null :users, :password_digest, false
    change_column_null :users, :session_token, false
  end
end
