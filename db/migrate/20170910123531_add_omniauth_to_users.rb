class AddOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_auths do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.text :raw
    end

    add_index :user_auths, :user_id
  end
end
