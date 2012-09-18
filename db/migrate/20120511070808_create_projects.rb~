class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :company_name
      t.references :user

      t.timestamps
    end
    add_index :projects, :user_id
  end
end
