class CreatePlaybooks < ActiveRecord::Migration[5.2]
  def change
    create_table :playbooks do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :situation

      t.timestamps
    end
  end
end
