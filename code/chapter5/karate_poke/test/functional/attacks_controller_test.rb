#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'

class AttacksControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  
  def test_new_requires_auth
    facebook_get :new, :fb_sig_user=>nil
    assert_facebook_redirect_to Facebooker::Session.create.login_url
  end
  
  def test_index_redirects_to_new_with_no_battles
    facebook_get :index
    assert_facebook_redirect_to new_attack_path
  end
  
  def test_can_view_own_battles
    #make sure the user has a battle
    User.for(1234).attack(users(:mike),moves(:chop))
    facebook_get :index
    assert_response :success
    assert_template "index"
  end
  
  def test_can_view_others_battles
    facebook_get :index, :user_id=>users(:mike).id
    assert_equal assigns(:user),users(:mike)
    assert_response :success
    assert_template "index"
  end
  
  def test_can_attack_single_user
    facebook_post :create, :attack=>{:move_id=>moves(:chop).id},:ids=>["5678"]
    assert_facebook_redirect_to new_attack_path
    assert_equal 1, User.for(1234).attacks.count
  end
  
  def test_can_attack_multiple_users
    facebook_post :create, :attack=>{:move_id=>moves(:chop).id},:ids=>["5678","9101112"]
    assert_facebook_redirect_to new_attack_path
    assert_equal 2, User.for(1234).attacks.count
  end
end
