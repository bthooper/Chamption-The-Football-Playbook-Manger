class CreateOpponents < ActiveRecord::Migration[5.2]
  def change
    create_table :opponents do |t|
      t.string :name
      t.string :mascot

      t.timestamps
    end
  end
end
