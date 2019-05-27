class AddFlatToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :flat, foreign_key: true
  end
end
