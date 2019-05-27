class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.references :assignment, foreign_key: true
      t.integer :assignment_proposal_id
      t.boolean :chosen
      t.string :description

      t.timestamps
    end
  end
end
