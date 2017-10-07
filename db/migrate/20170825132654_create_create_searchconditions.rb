class CreateCreateSearchconditions < ActiveRecord::Migration[5.1]
  def change
    create_table :searchconditions do |t|
      t.string :uid_id, limit: 128
      t.string :keyword, limit: 128

      t.timestamps
    end

    add_index :searchconditions, :uid_id, unique: true

  end
end
