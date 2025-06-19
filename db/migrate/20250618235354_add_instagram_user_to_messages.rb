class AddInstagramUserToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :instagram_user, null: true, foreign_key: true
  end
end
