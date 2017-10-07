class AddIndexToTweet < ActiveRecord::Migration[5.1]
  def change
    change_column :tweets, :uuid, limit: 128
    add_index :tweets, :uuid, unique: true
  end
end
