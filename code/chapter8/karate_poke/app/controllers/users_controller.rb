#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class UsersController < ApplicationController
  def update
    saved = current_user.update_attribute(:nickname,params[:nickname])
    # the update was a success, show the closed_form
    render :partial=>"nickname", :locals=>{:closed=>saved}
  end
end
