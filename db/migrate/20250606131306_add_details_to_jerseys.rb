class AddDetailsToJerseys < ActiveRecord::Migration[7.1]
  def change
    add_column :jerseys, :brand, :string
    add_column :jerseys, :size, :string
    add_column :jerseys, :condition, :string
  end
end
