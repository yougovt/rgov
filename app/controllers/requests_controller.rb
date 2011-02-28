class RequestsController < ApplicationController
  
  def new
    @request = Request.new
    @title = "File an RTI request online"
  end
  
  def create
    @request = Request.new(params[:request])
    #need to build email verification here for non-signed in users
    if @request.save 
      flash[:success] = "Request added to queue!"
      redirect_to @request
    else
      @title = "File an RTI request online"
      render 'new'
    end
  end
  
  def show
    @request = Request.find(params[:id])
    @agency = Page.find_by_id(@request.page_id)
    @allagencies = Page.all 
    @title = @request.sub
    
    prawnto :prawn => {
      :page_size => 'A4',
      :left_margin => 50,
      :right_margin => 50,
      :top_margin => 40,
      :bottom_margin => 24}, 
      :filename=>"#{@request.id}.pdf" 
    
   # respond_to do |format|
   # 	format.html
   # 	format.pdf
   # end
    
  end
  
  def destroy
    Request.find(params[:id]).destroy
    flash[:success] = "Request deleted."
    # need to add code so original requester knows when their request is deleted
    redirect_to root_path
  end
  
  def edit
  	@title = "Edit your RTI request..."
  	@request = Request.find(params[:id])
  end
  
  def update
    @request = Request.find(params[:id])
    if @request.update_attributes(params[:page])
      flash[:success] = "Request added to queue!"
      redirect_to @request
    else
      @title = "Edit your RTI request..."
      render 'edit'
    end
  end 

end
