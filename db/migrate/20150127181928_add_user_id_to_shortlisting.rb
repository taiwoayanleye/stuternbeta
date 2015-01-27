class AddUserIdToShortlisting < ActiveRecord::Migration
  def change
    add_column :shortlistings, :user_id, :integer
  end
end
