class PagesController < ApplicationController
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
  
  def show
    @agency = Page.find(params[:id])
    @title = @agency.orgname
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