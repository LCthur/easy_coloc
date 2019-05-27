class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :description
      t.string :photo_url
      t.references :assignment, foreign_key: true
      t.references :roommate, foreign_key: true

      t.timestamps
    end
  end
end
