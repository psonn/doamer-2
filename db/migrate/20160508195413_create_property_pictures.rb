class CreatePropertyPictures < ActiveRecord::Migration
  def change
    create_table :property_pictures do |t|
      t.string :name
      t.string :avatar_url

      t.timestamps null: false
    end
  end
end
