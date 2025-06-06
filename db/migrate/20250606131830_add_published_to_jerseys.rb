class AddPublishedToJerseys < ActiveRecord::Migration[7.1]
  def change
    add_column :jerseys, :published, :boolean
  end
end
