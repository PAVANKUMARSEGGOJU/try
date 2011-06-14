#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.expand_path(File.dirname(__FILE__) + '/../../rails_test_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../lib/facebooker/rails/integration_session')

class Facebooker::Rails::IntegrationSessionTest < Test::Unit::TestCase 

  def test_include_api_key_in_default_request_params
    ENV['FACEBOOK_API_KEY'] = 'a key'
    integration_session = Facebooker::Rails::IntegrationSession.new
    integration_session.reset!
    assert_equal 'a key', integration_session.default_request_params[ :fb_sig_api_key ]
  end

end
