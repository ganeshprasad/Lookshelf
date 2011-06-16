class AddFieldsToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :y, :integer
    add_column :tags, :width, :integer
    add_column :tags, :height, :integer
    add_column :tags, :x, :integer
  end

  def self.down
    remove_column :tags, :x
    remove_column :tags, :height
    remove_column :tags, :width
    remove_column :tags, :y
  end
end
