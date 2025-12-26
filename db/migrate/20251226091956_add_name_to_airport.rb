class AddNameToAirport < ActiveRecord::Migration[8.0]
  def change
    add_column :airports, :name, :string
  end
end
