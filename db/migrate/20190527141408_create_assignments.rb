class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.date :deadline
      t.boolean :done_state
      t.references :roommate, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
