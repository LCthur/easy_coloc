class CreateRoommates < ActiveRecord::Migration[5.2]
  def change
    create_table :roommates do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar_url
      t.string :email
      t.boolean :admin
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
