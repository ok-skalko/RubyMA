class RenameUsersUsernameToPersonalDataAndChangeTypeToJson < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :username, :personal_data
    change_column :users, :personal_data, :json, using: 'personal_data::JSON'
  end
end
