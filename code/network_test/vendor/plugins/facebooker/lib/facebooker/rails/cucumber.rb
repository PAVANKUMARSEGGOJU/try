#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require 'facebooker/rails/cucumber/world'
require 'facebooker/mock/session'
require 'facebooker/mock/service'

Facebooker::MockService.fixture_path = File.join(RAILS_ROOT, 'features', 'support', 'facebook')

module Facebooker
  class << self
    # prevent Facebooker from adding canvas name as prefix to URLs
    def request_for_canvas(arg)
      yield
    end
  end
  
  module Rails
    module Controller
      # prevent Facebooker from rendering fb:redirect
      def redirect_to(*args)
        super
      end
      
      # Return the mock session
      def new_facebook_session
        Facebooker::MockSession.create
      end
    end
  end
end
