#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery  :secret => 'a7cabcdf1499df9ded55d8a3797d9387'
  ensure_authenticated_to_facebook
  
  
	helper_attr :current_user
  

  
  attr_accessor :current_user
  before_filter :set_current_user

  def set_current_user
    self.current_user = User.for(facebook_session.user.to_i,facebook_session)
  end
  

end
