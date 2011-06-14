#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class LeadersController < ApplicationController
  skip_before_filter :ensure_application_is_installed_by_facebook_user

  
  def index
    @leaders = User.paginate(:order=>"total_hits desc",
                             :page=>(params[:page]||1))
  end
  
end
