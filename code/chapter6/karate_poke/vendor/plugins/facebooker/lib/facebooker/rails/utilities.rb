#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  module Rails
    class Utilities
      class << self
        def refresh_all_images(session)
          Dir.glob(File.join(RAILS_ROOT,"public","images","*.{png,jpg,gif}")).each do |img|
            refresh_image(session,img)
          end
        end
        
        def refresh_image(session,full_path)
          basename=File.basename(full_path)
          base_path=ActionController::Base.asset_host
          base_path += "/" unless base_path.ends_with?("/")
          image_path=base_path+"images/#{basename}"
          puts "refreshing: #{image_path}"
          session.server_cache.refresh_img_src(image_path)
        end
      end
    end
  end
end