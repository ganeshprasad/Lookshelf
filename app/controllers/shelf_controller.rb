class ShelfController < ApplicationController
   before_filter :is_user_allowed
  
  
  def zoom_in

    @user = User.find(params[:id])
  end

  def borrower_page
#    @waiting_list = Lender.find(:all, :conditions => ["borrower_id = ? AND status = ?", self.current_user.id, Lender::WAITING])
#    @received_list = Lender.find(:all, :conditions => ["borrower_id = ? AND status = ?", self.current_user.id, Lender::RECEIVED])
#    @loaned_out_list = Lender.find(:all, :conditions => ["borrower_id = ? AND status = ?", self.current_user.id, Lender::LOANED_OUT])
   @waiting_list = Lender.where(["borrower_id = ? AND status = ?", self.current_user.id, Lender::WAITING])
    @received_list = Lender.where(["borrower_id = ? AND status = ?", self.current_user.id, Lender::RECEIVED])
    @loaned_out_list = Lender.where(["borrower_id = ? AND status = ?", self.current_user.id, Lender::LOANED_OUT])


  end

  def sender_page
    
  end

end
