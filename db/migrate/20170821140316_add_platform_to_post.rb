class AddPlatformToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :platform, :string
    add_column :comments, :platform, :string
  end
end
