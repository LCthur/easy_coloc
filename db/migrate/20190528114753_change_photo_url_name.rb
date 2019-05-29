class ChangePhotoUrlName < ActiveRecord::Migration[5.2]
  def change
    rename_column :issues, :photo_url, :photo
  end
end
