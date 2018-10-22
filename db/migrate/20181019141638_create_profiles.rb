class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :role
      t.string :nickname
      t.integer :user_id

      t.timestamps
    end
  end
end
