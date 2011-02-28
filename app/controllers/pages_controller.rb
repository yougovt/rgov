class PagesController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update, :create, :new]
  before_filter :admin_user,   :only => :destroy

  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
  
  def index
    @title = "All agencies"
    # Handle autocomplete and normal page display differently
    if params[:term]
		# Limit the number of records assigned to @pages, by using the term value as a filter
    	@pages = Page.find(:all,:conditions => ['orgname LIKE ?', "#{params[:term]}%"])	
    else
      	# For normal display on the pages/index page
      	@pages = Page.paginate(:page => params[:page])
    end
    
    respond_to do |format|
    	format.html #index.html.erb
    	format.json { render :json => @pages.to_json }
    end
    
  end
  
  def show
    @agency = Page.find(params[:id])
    @existing_services = @agency.services 
	@service = Service.new
    @title = @agency.orgname
    
    prawnto :prawn => {
      :page_size => 'A4',
      :left_margin => 50,
      :right_margin => 50,
      :top_margin => 40,
      :bottom_margin => 24}, 
      :filename=>"#{@title.gsub(' ','_')}.pdf" 
    
   # respond_to do |format|
   # 	format.html
   # 	format.pdf
   # end
    
  end

  def new
    @agency = Page.new
    @title = "Add a new department"
  end
  
  def create
    @agency = Page.new(params[:page])
    if @agency.save
      flash[:success] = "Agency added!"
      redirect_to @agency
    else
      @title = "Add a new department"
      render 'new'
    end
  end
  
  def destroy
    Page.find(params[:id]).destroy
    flash[:success] = "Agency deleted."
    redirect_to pages_path
  end
  
  def edit
  	@title = "Edit department info"
  	@agency = Page.find(params[:id])
  end
  
  def update
    @agency = Page.find(params[:id])
    if @agency.update_attributes(params[:page])
      flash[:success] = "Agency updated."
      redirect_to @agency
    else
      @title = "Edit department info"
      render 'edit'
    end
  end  

end