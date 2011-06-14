class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :shelf_name, :string
    add_column :users, :shelf_location, :string
    add_column :users, :full_name, :string
    add_column :users, :phone, :string
    add_column :users, :shipping_address, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
    add_column :users, :lookshelf_notification, :boolean
    add_column :users, :news_feed, :boolean
    add_column :users, :event_notification, :boolean
    
  end

  def self.down
  end
end
