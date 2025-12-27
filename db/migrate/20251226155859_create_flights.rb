class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.string :duration
      t.references :departure_airport, null: false, foreign_key: { to_table: :airport }
      t.references :arrival_airport, null: false, foreign_key: { to_table: :airport }
      t.datetime :start_time

      t.timestamps
    end
  end
end
