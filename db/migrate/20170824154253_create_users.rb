class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider, limit: 128
      t.string :uid, limit: 128

      t.timestamps
    end

    add_index :users, [:provider, :uid], unique: true

  end
end
