class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :micropost
      t.references :user
      t.references :project

      t.timestamps
    end
    add_index :comments, :micropost_id
    add_index :comments, :user_id
    add_index :comments, :project_id
  end
end
