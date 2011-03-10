class RequestObserver < ActiveRecord::Observer
  def after_save(request)
	# need to add code so that if request is saved again
	# then user does not get another email (uncommon but possible)
    if request.submitted?
  		UserMailer.request_submitted(request).deliver
  	end
  end
end  