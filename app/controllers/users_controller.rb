class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  before_filter :is_user_allowed, :only => [:account_settings]

  layout "application"

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    
    if data = RPXNow.user_data(params[:token])
      
      data = {:name => data[:username], :email => data[:email], :identifier => data[:identifier]}
      self.current_user = User.find_by_identifier(data[:identifier]) || User.create!(data)
      redirect_to '/'
    else

      flash[:error] = :default
      redirect_to :action => :new
    end
  end

  def destroy
    #logger.info(session)
    self.current_user = nil
    #    @current_user = nil
    #    session.delete(:user_id)
    #    session.delete(:session_id)
    #    logger.info(session)
    redirect_to root_url
  end

  def home

    if params[:tag].blank?
      #@users = User.paginate :per_page => 5, :page => params[:page], :joins => :tags, :conditions => ['users.shelf_name LIKE ? OR users.shelf_location LIKE ? OR tags.title LIKE ?', "%#{params[:tag]}%", "%#{params[:tag]}%", "%#{params[:tag]}%"], :order => 'updated_at DESC'
      @users= User.all.paginate :per_page => 5, :page => params[:page], :order => "updated_at desc"
    else
      @users = User.tag_search(params[:tag], params[:page])
     # @users = User.all.paginate :per_page => 5, :page => params[:page], :joins => :tags, :conditions => ['users.shelf_name LIKE ? OR users.shelf_location LIKE ? OR tags.title LIKE ?', "%#{params[:tag]}%", "%#{params[:tag]}%", "%#{params[:tag]}%"], :order => 'updated_at DESC'
    logger.info(@users.size)
      #@users= User.find(:all, :conditions => ["shelf_name LIKE ?  OR shelf_location LIKE ? ", params[:tag], params[:tag]], :order => "updated_at desc", :limit => 5)

      if @users.empty?
        @users= User.all.paginate :per_page => 5, :page => params[:page], :order => "updated_at desc"
      end
      
    end

  end

  def account_settings
    @user = User.find(current_user)

  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(root_url, :notice => 'Account was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "account_settings" }
        format.xml  { render :xml => @uuser.errors, :status => :unprocessable_entity }
      end
    end
  end

  protected
  def is_user_allowed
    self.current_user = self.current_user || nil
    # if ! current_user.role == "admin"
    if  current_user.nil? #|| current_user.role != "user"
      redirect_to(root_url)
    end
  end
end
