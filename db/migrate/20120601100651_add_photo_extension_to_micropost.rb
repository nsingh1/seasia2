class AddPhotoExtensionToMicropost < ActiveRecord::Migration
  def change
add_column :microposts, :extension, :string
  end
end
