class ShelfController < ApplicationController
   before_filter :is_user_allowed
   before_filter :is_registered, :only => [:zoom_in]
  
  
  def zoom_in

    @user = User.find(params[:id])
  end

  def borrower_page
#    @waiting_list = Lender.find(:all, :conditions => ["borrower_id = ? AND status = ?", self.current_user.id, Lender::WAITING])
#    @received_list = Lender.find(:all, :conditions => ["borrower_id = ? AND status = ?", self.current_user.id, Lender::RECEIVED])
#    @loaned_out_list = Lender.find(:all, :conditions => ["borrower_id = ? AND status = ?", self.current_user.id, Lender::LOANED_OUT])
   @waiting_list = Lender.where(["borrower_id = ? AND status = ?", self.current_user.id, Lender::WAITING])
   logger.info(@waiting_list.size)
    @received_list = Lender.where(["borrower_id = ? AND status = ?", self.current_user.id, Lender::RECEIVED])
    logger.info(@received_list.size)
    @loaned_out_list = Lender.where(["borrower_id = ? AND status = ?", self.current_user.id, Lender::LOANED_OUT])
    logger.info(@loaned_out_list.size)


  end

  def lender_page

    @request_list = Lender.where(["lender_id = ? AND status = ?", self.current_user.id, Lender::WAITING])

    @sent_list = Lender.where(["lender_id = ? AND status = ?", self.current_user.id, Lender::RECEIVED])
    @over_due_list  = Lender.where(["lender_id = ? AND status = ?", self.current_user.id, Lender::OVER_DUE])
    
  end

  def accept
    @lender = Lender.find(params[:id])
    @lender.update_attribute(:status, Lender::RECEIVED)
    redirect_to :action => "lender_page"
  end


  def reject

    @lender = Lender.find(params[:id])
    @lender.update_attribute(:status, Lender::LOANED_OUT)
    redirect_to :action => "lender_page"
  end

  def loaned_out

    @lender = Lender.find(params[:id])
    @lender.update_attribute(:status, Lender::LOANED_OUT)
    redirect_to :action => "lender_page"
  end
end
