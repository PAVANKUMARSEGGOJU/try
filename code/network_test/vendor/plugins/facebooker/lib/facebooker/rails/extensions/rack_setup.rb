#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
# Somewhere in 2.3 RewindableInput was removed- rack supports it natively
require 'rack/facebook'
require 'rack/facebook_session'

ActionController::Dispatcher.middleware.insert_before( 
  ActionController::ParamsParser,
  Rack::Facebook
)

# ActionController::Dispatcher.middleware.insert_before(
#   ActionController::Base.session_store,
#   Rack::FacebookSession,
#   lambda { ActionController::Base.session_options[:key] }
# )