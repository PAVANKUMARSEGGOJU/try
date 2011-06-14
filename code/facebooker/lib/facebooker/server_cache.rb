#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  class ServerCache
    def initialize(session)
      @session = session
    end
    
    # 
    # Stores an FBML reference on the server for use 
    # across multiple users in FBML
    def set_ref_handle(handle_name, fbml_source)
      (@session.post 'facebook.fbml.setRefHandle', :handle => handle_name, :fbml => fbml_source) == '1'
    end
    
    ##
    # Fetches and re-caches the content stored at the given URL, for use in a fb:ref FBML tag.
    def refresh_ref_url(url)
      (@session.post 'facebook.fbml.refreshRefUrl', :url => url) == '1'
    end
    
    def refresh_img_src(url)
      (@session.post 'facebook.fbml.refreshImgSrc', :url => url) == '1'
    end
  end
end