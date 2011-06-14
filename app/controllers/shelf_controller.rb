class ShelfController < ApplicationController
  
  
  def zoom_in

    @user = User.find(params[:id])
  end

end
