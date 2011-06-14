class User < ActiveRecord::Base




   has_attached_file :shelf_image,
     :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>",
       :profile => "100x100#"}

   has_attached_file :profile_image,
     :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>",
        :profile => "100x100#"}

  def to_s
    name
  end
end