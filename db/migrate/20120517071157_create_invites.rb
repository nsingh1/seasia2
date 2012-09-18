class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :name
      t.string :mail
      t.references :project
      t.references :user
      
      t.timestamps
    end
    add_index :invites, :project_id
    add_index :invites, :user_id
    end
end
