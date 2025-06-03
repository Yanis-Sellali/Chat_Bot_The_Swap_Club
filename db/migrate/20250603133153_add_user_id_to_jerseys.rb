class AddUserIdToJerseys < ActiveRecord::Migration[7.1]
  def change
    add_reference :jerseys, :user, null: false, foreign_key: true
  end
end
