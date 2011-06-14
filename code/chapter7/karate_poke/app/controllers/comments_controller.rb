#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class CommentsController < ApplicationController
  def create
    comment_receiver = User.find(params[:comment_receiver])
    current_user.comment_on(comment_receiver,params[:body])
    if request.xhr?
      @comments=comment_receiver.comments(true)
      render :json=>{:ids_to_update=>[:all_comments,:form_message],
              :fbml_all_comments=>render_to_string(:partial=>"comments"),
              :fbml_form_message=>"Your comment has been added."}
    else
      redirect_to battles_path(:user_id=>comment_receiver.id)
    end
  end

end
