class ChangeAvatarName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :avatar, :avatar_photo
  end
end
