class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.string :name
      t.string :description
      t.integer :playbook_id

      t.timestamps
    end
  end
end
