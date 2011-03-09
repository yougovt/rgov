class RequestsController < ApplicationController
  
  
  
  def new
    @request = Request.new
    @pages = Page.all
    @pages.sort! { |a,b| a.orgname.downcase <=> b.orgname.downcase }
    if signed_in? 
    	@request.email = current_user.email
    	@request.first_name = current_user.name
    	@request.last_name = current_user.name
    end	
    @title = "File an RTI request online"
  end
  
  def create
    @request = Request.new(params[:request])
	create_permalink( @request )
    #need to build email verification here for non-signed in users
    if @request.save 
      flash[:success] = "Successfully created new request! But wait, you aren't done yet..."
      redirect_to edit_request_path(@request)
    else
      @title = "File an RTI request online"
      @pages = Page.all
      @pages.sort! { |a,b| a.orgname.downcase <=> b.orgname.downcase }
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
    if @request.update_attributes(params[:request])
      flash[:success] = "Your RTI request has been updated!"
      redirect_to edit_request_path(@request)
    else
      flash[:notice] = "Please correct the errors below."
      @title = "Edit your RTI request..."
      render 'edit'
    end
  end 
  
  def upload(request)
  	Scribd::API.instance.key = '6r2zurc4lhjgovi2czrt3'
	Scribd::API.instance.secret = 'sec-2as20tof0tzq23jklykcws2wqc'
	Scribd::User.login 'info@yougovt.in', 'govster'
	
	doc = Scribd::Document.upload(:file => '/pages/#{request.id}.pdf', :access => 'private')
	
  end
  
  private
  
  def create_permalink( request )
      request.permalink = request.sub.gsub(/\s/, "-").gsub(/[^\w-]/, '').downcase
  end

end
