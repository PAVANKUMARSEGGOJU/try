#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.expand_path(File.dirname(__FILE__) + '/../../rails_test_helper')
require 'facebooker/rails/facebook_request_fix_2-3' if Rails.version >= '2.3'
class Facebooker::Rails::FacebookRequestFix23Test < Test::Unit::TestCase

  def setup
    ENV['FACEBOOK_API_KEY'] = '1234567'
    ENV['FACEBOOK_SECRET_KEY'] = '7654321'
    if Rails.version < '2.3'      
      @request = ActionController::TestRequest.new({"fb_sig_is_ajax"=>"1"}, {}, nil)
      
    else
      @request = ActionController::TestRequest.new
      @request.query_parameters[:fb_sig_is_ajax] = "1"
    end
  end

  def test_xhr_when_is_ajax
    assert @request.xhr?
  end

  def test_xml_http_request_when_is_ajax
    assert @request.xml_http_request?
  end

end
