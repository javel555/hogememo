class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|

      t.string :uid_id
      t.string :uuid
      t.string :nickname
      t.string :text

      t.timestamps
    end
  end
end
