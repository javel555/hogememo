class AddColumnsToUsersTokenSecret < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token, :string
    add_column :users, :secret, :string
  end
end
