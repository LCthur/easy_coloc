class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :name
      t.boolean :task_management
      t.boolean :event_management

      t.timestamps
    end
  end
end
