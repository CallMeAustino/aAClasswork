class ModifyUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :emails
    rename_column :users, :names, :username
  end
    
end
