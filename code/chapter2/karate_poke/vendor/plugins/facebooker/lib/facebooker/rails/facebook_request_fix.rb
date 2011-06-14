#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module ::ActionController
  class AbstractRequest
    def request_method_with_facebooker
      if parameters[:fb_sig_request_method]=="GET" and parameters[:_method].blank?
        parameters[:_method]="GET"
      end
      request_method_without_facebooker
    end
    
    if new.methods.include?("request_method")
      alias_method_chain :request_method, :facebooker 
    end
    
    def xml_http_request_with_facebooker?
      parameters["fb_sig_is_mockajax"] == "1"  ||
      parameters["fb_sig_is_ajax"] == "1" ||
      xml_http_request_without_facebooker?
    end
    alias_method_chain :xml_http_request?, :facebooker
    # we have to re-alias xhr? since it was pointing to the old method
    alias xhr? :xml_http_request?
    
  end
end