#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'

class InvitationsControllerTest < ActionController::TestCase
  def test_new_invitation
    facebook_get :new,:fb_sig_friends=>"1234,456"
    assert_response :success
    assert_template 'new'
  end

  def test_get_new_requires_user
    facebook_get :new, :fb_sig_user=>nil,:fb_sig_friends=>"1234,456"
    assert_facebook_redirect_to Facebooker::Session.create.login_url
  end

  def test_valid_create
    facebook_post :create,  :ids=>"1234"
    assert_response :success
    assert_template 'create'
  end        



end
