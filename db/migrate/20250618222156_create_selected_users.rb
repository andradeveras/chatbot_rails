class CreateSelectedUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :selected_users do |t|
      t.references :instagram_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
