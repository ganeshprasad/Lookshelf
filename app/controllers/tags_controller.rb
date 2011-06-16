class TagsController < ApplicationController
  # GET /tags
  # GET /tags.xml
  def index
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end

  def search
    
  end

  # GET /tags/1
  # GET /tags/1.xml
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  # GET /tags/new
  # GET /tags/new.xml
  def new
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  # GET /tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  # POST /tags.xml
  def create
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to(@tag, :notice => 'Tag was successfully created.') }
        format.xml  { render :xml => @tag, :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.xml
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to(@tag, :notice => 'Tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.xml
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(tags_url) }
      format.xml  { head :ok }
    end
  end

  def load_tags
    @tags = Tag.find(:all, :conditions => ["user_id = ?", params[:photoID]])
    data = []
    @tags.each do |tag|
      data << {"id" => tag.id, "PHOTOID" => tag.user_id, "X" => tag.x, "Y" => tag.y, "WIDTH" => tag.width, "HEIGHT" => tag.height, "MESSAGE" => tag.title}
    end
    # data = '[{"ID": "91BEE419-FFAE-1669-D1C2D19C8AC13C9A", "PHOTOID":"1","Y":148,"WIDTH":127,"HEIGHT":84,"MESSAGE":"amazing","X":237}]'
    # render :json => '[{"ID": "91BEE419-FFAE-1669-D1C2D19C8AC13C9A", "PHOTOID":"1","Y":148,"WIDTH":127,"HEIGHT":84,"MESSAGE":"amazing","X":237}]'
    render :json => data
    #render :json => '[]'
  end

  def save_tag

    @tag = Tag.new(:x => params[:x], :y => params[:y], :width => params[:width], :height => params[:height], :title => params[:message], :user_id => params[:photoID])
    @tag.save
    render :json => '[]'
  end

  def delete_tag
    render :json => '[]'
  end
end
