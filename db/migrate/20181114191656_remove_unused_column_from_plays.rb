class RemoveUnusedColumnFromPlays < ActiveRecord::Migration[5.2]
  def change
    remove_column :plays, :playbook_id 
  end
end
