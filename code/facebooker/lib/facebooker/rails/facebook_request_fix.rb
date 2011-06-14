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
  end
end