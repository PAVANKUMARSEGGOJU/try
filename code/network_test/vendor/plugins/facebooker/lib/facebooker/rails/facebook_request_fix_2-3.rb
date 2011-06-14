#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module ::ActionController

  class Request

    include Facebooker::Rails::BackwardsCompatibleParamChecks

    def request_method_with_facebooker
      if parameters[:_method].blank?
        if %w{GET HEAD}.include?(parameters[:fb_sig_request_method])
          parameters[:_method] = parameters[:fb_sig_request_method]
        end
      end
      request_method_without_facebooker
    end

    if new({}).methods.include?("request_method")
      alias_method_chain :request_method, :facebooker
    end

    def xml_http_request_with_facebooker?
      one_or_true(parameters["fb_sig_is_mockajax"])  ||
      one_or_true(parameters["fb_sig_is_ajax"]) ||
      xml_http_request_without_facebooker?
    end
    alias_method_chain :xml_http_request?, :facebooker

    # we have to re-alias xhr? since it was pointing to the old method
    alias :xhr? :xml_http_request?

  end
end
