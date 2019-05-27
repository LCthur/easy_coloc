class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.boolean :chosen
      t.string :description
      t.references :assignment, foreign_key: true
      t.integer :assignment_proposal_id

      t.timestamps
    end
  end
end
