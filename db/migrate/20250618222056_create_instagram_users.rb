class CreateInstagramUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :instagram_users do |t|
      t.string :username

      t.timestamps
    end
  end
end
