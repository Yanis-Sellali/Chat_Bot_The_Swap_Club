class AddImageUrlToJerseys < ActiveRecord::Migration[7.1]
  def change
    add_column :jerseys, :image_url, :string
  end
end
