class CreateFloads < ActiveRecord::Migration
  def change
    create_table :floads do |t|
      t.references :micropost
      t.references :project
      t.references :user

      t.timestamps
    end
    add_index :floads, :micropost_id
    add_index :floads, :project_id
    add_index :floads, :user_id
  end
end
