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
    module TestHelpers
      def assert_fb_redirect_to(url)
        assert_equal "fb:redirect", response_from_page_or_rjs.children.first.name
        assert_equal url, response_from_page_or_rjs.children.first.attributes['url']    
      end
    end
  end
end
        