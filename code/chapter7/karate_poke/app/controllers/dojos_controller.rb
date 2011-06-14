#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class DojosController < ApplicationController
  def show
    @sensei = User.find(params[:id])
    @disciples = @sensei.disciples
    disciple_ids = @disciples.map(&:facebook_id).join(",")
    users=current_user.facebook_session.fql_query(
     "select uid,hometown_location from user "+
     "where uid in (#{disciple_ids})")

    @user_hash={}
    for user in users
      @user_hash[user.uid]=user
    end
  end

end
