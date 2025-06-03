class CreateJerseys < ActiveRecord::Migration[7.1]
  def change
    create_table :jerseys do |t|
      t.string :name
      t.string :team
      t.string :flocking
      t.integer :year
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
