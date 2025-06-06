class AddTitleToJerseys < ActiveRecord::Migration[7.1]
  def change
    add_column :jerseys, :title, :string
  end
end
