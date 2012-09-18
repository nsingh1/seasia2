class AddPhotoExtensionToComment < ActiveRecord::Migration
  def change
  add_column :comments, :extension, :string

  end
end
