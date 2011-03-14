class RequestObserver < ActiveRecord::Observer
  def after_save(request)
	# need to add code so that if request is saved again
	# then user does not get another email (uncommon but possible)
    if request.submitted?
  		UserMailer.request_submitted(request).deliver
  	end	
  	
#  	if request.uneditable?
#		response = RestClient.get 'api.scribd.com/api', {:params => {:method => 'docs.uploadFromUrl', :api_key => '6r2zurc4lhjgovi2czrt3', :url => 'www.rgov.in/requests/4-.pdf', :doc_type => 'pdf', :access => 'private'}} #{request.id}-#{request.permalink}
#		if response
#			doc = Nokogiri::XML(response)
#			request.access_key = doc.xpath('.//rsp/access_key').text
#			request.secret_password = doc.xpath('.//rsp/secret_password').text
#			request.docID = doc.xpath('.//rsp/doc_id').text
#			request.save
#		end
#  	end
  	
  end
end  