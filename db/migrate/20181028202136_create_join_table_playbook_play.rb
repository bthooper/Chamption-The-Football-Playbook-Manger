class CreateJoinTablePlaybookPlay < ActiveRecord::Migration[5.2]
  def change
    create_join_table :playbooks, :plays do |t|
      # t.index [:playbook_id, :play_id]
      # t.index [:play_id, :playbook_id]
    end
  end
end
