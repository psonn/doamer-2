class CreatePropertyPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :property_pictures do |t|
      t.string :name
      t.string :avatar_url

      t.timestamps null: false
    end
  end
end
