class AddCreatedByAiToJerseys < ActiveRecord::Migration[7.1]
  def change
    add_column :jerseys, :created_by_ai, :boolean
  end
end
