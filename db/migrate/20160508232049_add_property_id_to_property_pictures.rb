class AddPropertyIdToPropertyPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :property_pictures, :property_id, :integer
  end
end
