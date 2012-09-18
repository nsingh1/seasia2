class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.references :project
      t.references :user

      t.timestamps
    end
    add_index :microposts, :project_id
    add_index :microposts, :user_id
  end
end
