class ServicesController < ApplicationController

  def create
  
  	@service = Service.create!(params[:service])
  	flash[:notice] = "Agency added!"
  	respond_to do |format|
  		format.html { redirect_to page_path(@service.page_id) }
  		format.js
  	end
  
  #	agency = Page.find_by_id(params[:page_id])
  #	@service = agency.services.build(params[:service])
  #	if @service.save
  #		flash[:success] = "Service added"
  #	end
  #	redirect_to @agency
  end
  
  def new
  end

  def edit
  end

  def show
  end
  
  def destroy
    agency_id = Service.find(params[:id]).page_id
    Service.find(params[:id]).destroy
    flash[:success] = "Service deleted."
    redirect_to page_path(agency_id)
  end

end
