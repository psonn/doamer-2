class AddPropertyIdToPropertyPictures < ActiveRecord::Migration
  def change
    add_column :property_pictures, :property_id, :integer
  end
end
