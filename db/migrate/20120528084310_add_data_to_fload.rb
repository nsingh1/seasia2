class AddDataToFload < ActiveRecord::Migration
  def change
    add_column :floads, :extension, :string
  end
end
