class ChangeAvatarUrlName < ActiveRecord::Migration[5.2]
  def change
   rename_column :users, :avatar_url, :avatar
  end
end
