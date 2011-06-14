#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class AttacksController < ApplicationController
  
  skip_before_filter :ensure_authenticated_to_facebook, 
                     :only => [:index,:tab]
  
  
  def new
    if params[:from]
      current_user.update_attribute(:sensei,User.find(params[:from]))
    end
  end
  

  def create
    if params[:ids].blank?
      flash[:error] = "You forgot to tell me who you wanted to attack!"      
    else
    
      attack = Attack.new(params[:attack])
      hits = []
      misses = []
      for id in params[:ids]
        attack = current_user.attack(User.for(id),attack.move)
        if attack.hit?
          hits << attack
        else
          misses << attack
        end
      end
      AttackPublisher.deliver_attack_feed(attack) rescue nil
      flash[:notice] = "Your attack resulted in #{hits.size} " +
        (hits.size==1 ? "hit" : "hits") +
        " and #{misses.size} "+
        (misses.size == 1 ? "miss" : "misses") + "."
    end
    redirect_to new_attack_path
  end
  
  
  def tab
    @user = User.for(params[:fb_sig_profile_user])
    @battles = @user.battles
    render :action=>"tab",:layout=>"tab"
  end
  

  
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end
    # If we don't have a user, require add
    if @user.blank?
      ensure_authenticated_to_facebook   
      return 
    end
    
    @battles = @user.battles
    
    if @battles.blank?
      flash[:notice]="You haven't battled anyone yet."+
        " Why don't you attack your friends?"
      redirect_to new_attack_path
    else
      @comments = @user.comments
    end
    
  end
end
