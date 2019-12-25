class AddImageUrlToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :image_url, :string
  end
end
