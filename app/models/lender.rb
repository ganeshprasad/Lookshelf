class Lender < ActiveRecord::Base

  belongs_to :lender, :foreign_key => :lender_id, :class_name => "User"
  belongs_to :borrower, :foreign_key => :borrower_id, :class_name => "User"
  belongs_to :tag, :foreign_key => :tag_id, :class_name => "Tag"

  validates :lender_id, :presence => true
  validates :borrower_id, :presence => true
  validates :status, :presence => true
  validates :tag_id, :presence => true
  validates :date_of_request, :presence => true

  def lender_name
    lender.full_name
  end

  def borrower_name
    borrower.full_name
  end

  def book_title
    tag.try(:title)
  end

#  def date_of_request
#    date_of_request
#  end

  def estimated_delivery_date
    date_of_request + 30.days
  end

  WAITING = "waiting"
  RECEIVED = "received"
  LOANED_OUT = "loaned_out"
  OVER_DUE = "over_due"
end
