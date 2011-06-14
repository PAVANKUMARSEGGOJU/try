#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'

class ProfilePublisherControllerTest < ActionController::TestCase
  
  def test_get_interface
    facebook_get :index, :fb_sig_profile_user=>"1234",:method=>"publisher_getInterface"
    assert_template "_form"
  end
  
  def test_creates_attack
    facebook_get :index, :fb_sig_profile_user=>"1234",
      :app_params=>{:attack=>{:move_id=>moves(:chop).id}},
      :method=>"publisher_getFeedStory"
    assert_match /publisher_getFeedStory/,@response.body
  end
  
end
