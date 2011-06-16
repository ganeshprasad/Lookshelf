class ShelfController < ApplicationController
  
  
  def zoom_in

    @user = User.find(params[:id])
  end

  def borrower_page

  end

  def sender_page
    
  end

end
