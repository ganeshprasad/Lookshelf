class User < ActiveRecord::Base

  has_many :tags



  def self.tag_search(tag, page)

    sql="SELECT * from users usrs" <<
      " left join tags tgs on usrs.id=tgs.user_id" <<
      " WHERE usrs.shelf_name LIKE ? OR usrs.shelf_location LIKE ? OR tgs.title LIKE ?"
 
    User.find_by_sql([sql, "%#{tag}%", "%#{tag}%", "%#{tag}%"]).paginate(
      :page => page,
      :per_page => 5,
      :order => "updated_at desc"
    )

  end




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