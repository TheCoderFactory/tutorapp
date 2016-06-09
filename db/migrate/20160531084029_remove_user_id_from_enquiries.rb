class RemoveUserIdFromEnquiries < ActiveRecord::Migration
  def change
    remove_column :enquiries, :user_id, :integer
  end
end

# We want to remove the column :user_id from the table :enquiries
