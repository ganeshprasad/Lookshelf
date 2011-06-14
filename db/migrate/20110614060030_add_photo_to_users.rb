class AddPhotoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :profile_image_file_name, :string
    add_column :users, :profile_image_content_type, :string
    add_column :users, :profile_image_file_size, :integer
    add_column :users, :shelf_image_file_name, :string
    add_column :users, :shelf_image_content_type, :string
    add_column :users, :shelf_image_file_size, :integer
  end

  def self.down
    remove_column :users, :shelf_image_file_size
    remove_column :users, :shelf_image_content_type
    remove_column :users, :shelf_image_file_name
    remove_column :users, :profile_image_file_size
    remove_column :users, :profile_image_content_type
    remove_column :users, :profile_image_file_name
  end
end
