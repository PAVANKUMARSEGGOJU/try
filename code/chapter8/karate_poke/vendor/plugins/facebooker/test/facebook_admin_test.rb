#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.dirname(__FILE__) + '/test_helper.rb'

class FacebookAdminTest < Test::Unit::TestCase
  def setup
    @session = Facebooker::Session.create('apikey', 'secretkey')
  end
  
  def test_can_ask_facebook_to_set_app_properties
    expect_http_posts_with_responses(example_set_properties_xml)
    properties = { :application_name => "Video Jukebox", :dev_mode => 0 }    
    assert(@session.admin.set_app_properties(properties))
  end
    
  def test_can_ask_facebook_to_get_app_properties
    expect_http_posts_with_responses(example_get_properties_xml)
    properties = [ :application_name, :dev_mode ]
    assert(@session.admin.get_app_properties(properties))
  end
  
  def test_can_get_properties
    mock_http = establish_session
    mock_http.should_receive(:post_form).and_return(example_get_properties_xml).once.ordered(:posts)
    p = @session.admin.get_app_properties(:application_name, :dev_mode)
    assert_equal 'Video Jukebox', p.application_name
    assert_equal 0, p.dev_mode
  end

  def test_can_get_allocation
    mock_http = establish_session
    mock_http.should_receive(:post_form).and_return(example_get_allocation_xml).once.ordered(:posts)
    alloc = @session.admin.get_allocation(:notifications_per_day)
    assert_equal 40, alloc
  end

  private
  def example_set_properties_xml
    <<-XML
    <?xml version="1.0" encoding="UTF-8"?>
    <admin_setAppProperties_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">1</admin_setAppProperties_response>
    XML
  end

  def example_get_properties_xml
    <<-XML
    <?xml version="1.0" encoding="UTF-8"?>
    <admin_getAppProperties_response
      xmlns="http://api.facebook.com/1.0/"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://api.facebook.com/1.0/http://api.facebook.com/1.0/facebook.xsd">
        {&quot;application_name&quot;:&quot;Video Jukebox&quot;,&quot;callback_url&quot;:&quot;http:\/\/67.207.144.245\/&quot;,&quot;dev_mode&quot;:0}
    </admin_getAppProperties_response>
    XML
  end
  
  def example_get_allocation_xml
    <<-XML
    <?xml version="1.0" encoding="UTF-8"?>
    <admin_getAllocation_response
      xmlns="http://api.facebook.com/1.0/"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://api.facebook.com/1.0/http://api.facebook.com/1.0/facebook.xsd">
        40
    </admin_getAllocation_response>
    XML
  end
    
end