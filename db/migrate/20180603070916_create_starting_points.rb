class CreateStartingPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :starting_points do |t|
      t.references :journey, foreign_key: true
      t.string :address
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
