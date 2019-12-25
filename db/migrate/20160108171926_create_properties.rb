class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :city
      t.string :state
      t.string :country
      t.string :latitude
      t.string :longitude
      t.string :postcode
      t.text :description_long
      t.text :description_short

      t.timestamps null: false
    end
    add_index :properties, :city
    add_index :properties, :state
    add_index :properties, :country
    add_index :properties, :postcode
  end
end
