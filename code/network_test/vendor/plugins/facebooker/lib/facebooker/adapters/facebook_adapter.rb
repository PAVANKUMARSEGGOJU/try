#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  
   
  class FacebookAdapter < AdapterBase
      
    def canvas_server_base
      "apps.facebook.com"
    end
      
    def api_server_base
       "api.facebook.com"
    end
    
    def video_server_base
      "api-video.facebook.com"
    end
    
    def www_server_base_url
      "www.facebook.com"
    end
    
    def api_rest_path
      "/restserver.php"
    end
    
    def api_key
      ENV['FACEBOOK_API_KEY'] || super      
    end
    
    def secret_key
      ENV['FACEBOOK_SECRET_KEY'] || super
    end
      
    def is_for?(application_context)
      application_context == :facebook
    end
       
  
       
    def login_url_base
      "http://#{www_server_base_url}/login.php?api_key=#{api_key}&v=1.0"
    end
       
    def install_url_base
      "http://#{www_server_base_url}/install.php?api_key=#{api_key}&v=1.0"
    end

    def connect_permission_url_base
      "http://#{www_server_base_url}/connect/prompt_permissions.php?api_key=#{api_key}&v=1.0"      
    end

    def permission_url_base
      "http://#{www_server_base_url}/authorize.php?api_key=#{api_key}&v=1.0"
    end
    
  end
  
end


