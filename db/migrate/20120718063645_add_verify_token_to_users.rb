class AddVerifyTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verify_token, :string
    add_column :users, :verify_sent_at, :datetime
  end
end
