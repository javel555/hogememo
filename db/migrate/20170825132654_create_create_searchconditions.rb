class CreateCreateSearchconditions < ActiveRecord::Migration[5.1]
  def change
    create_table :searchconditions do |t|
      t.string :uid_id
      t.string :keyword

      t.timestamps
    end

    add_index :searchconditions, :uid_id, unique: true

  end
end
