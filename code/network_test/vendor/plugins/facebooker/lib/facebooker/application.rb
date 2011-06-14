#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  class Application
    def initialize(session)
      @session = session
    end
    
    # +properties+: Hash of properties of the desired application. Specify exactly one of: application_id, application_api_key or application_canvas_name 
    # eg: application.get_public_info(:application_canvas_name => ENV['FACEBOOKER_RELATIVE_URL_ROOT'])
    def get_public_info(properties)
      (@session.post 'facebook.application.getPublicInfo', properties)
    end
  end
end