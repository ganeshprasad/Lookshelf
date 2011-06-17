class Tag < ActiveRecord::Base

  belongs_to :tag
  belongs_to :shelf, :conditions => "shelf_name != null", :foreign_key => :user_id
end
