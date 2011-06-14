#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class ProfilePublisherController < ApplicationController
  skip_before_filter :ensure_authenticated_to_facebook
  def index
    if current_user.nil? and facebook_params[:user]
      self.current_user = User.for(facebook_params[:user])
    end
    
    @defender = User.for(params[:fb_sig_profile_user])
    if wants_interface?
      render_publisher_interface(render_to_string(:partial=>"form"))
    else
      attack = Attack.new(params[:app_params][:attack])
      @attack = current_user.attack(@defender,attack.move)
      render_publisher_response(AttackPublisher.create_attack_feed(@attack))
    end
  end
  
end
