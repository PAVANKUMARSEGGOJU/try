#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.dirname(__FILE__) + '/test_helper.rb'
require 'rubygems'
require 'flexmock/test_unit'
require 'action_controller'
require 'action_controller/test_process'
require File.dirname(__FILE__)+'/../init'
require 'facebooker/rails/controller'
require 'facebooker/rails/helpers'
require 'facebooker/rails/publisher'


class TestPublisher < Facebooker::Rails::Publisher
  def action(f)
    send_as :action
    from f
    title "Action Title"
  end
  
  def templatized_action(f)
    send_as :templatized_action
    from f
    title_template "Templatized Action Title"
  end
  
  def story(to)
    send_as :story
    recipients to
    title 'Story Title'
  end
  
  def notification(to,f)
    send_as :notification
    recipients to
    from f
    fbml "Not"
  end

  def email(to,f)
    send_as :email
    recipients to
    from f
    title "Email"
    fbml 'text'
    text fbml
  end
  
  def no_send_as(to)
    recipients to
  end
  
  def invalid_send_as(to)
    send_as :fake
    recipients to
  end
  
end

class PublisherTest < Test::Unit::TestCase
  
  def setup
    @user = Facebooker::User.new
    @session = "session"
    @user.stubs(:session).returns(@session)
  end
  
  def test_create_action
    action=TestPublisher.create_action(@user)
    assert_equal Facebooker::Feed::Action,action.class
    assert_equal "Action Title",action.title
  end
  
  def test_deliver_action
    @user.expects(:publish_action)
    TestPublisher.deliver_action(@user)
  end
  
  def test_create_story
    action=TestPublisher.create_story(@user)
    assert_equal Facebooker::Feed::Story,action.class
    assert_equal "Story Title",action.title
  end
  
  def test_deliver_story
    @user.expects(:publish_story)
    TestPublisher.deliver_story(@user)    
  end
  
  def test_create_notification
    notification=TestPublisher.create_notification(12451752,@user)
    assert_equal Facebooker::Rails::Publisher::Notification,notification.class
    assert_equal "Not",notification.fbml
  end
  
  def test_deliver_notification
    @session.expects(:send_notification)
    TestPublisher.deliver_notification("12451752",@user)
  end
  
  def test_create_email
    email=TestPublisher.create_email("12451752",@user)
    assert_equal Facebooker::Rails::Publisher::Email,email.class
    assert_equal "Email",email.title
    assert_equal "text",email.text
    assert_equal "text",email.fbml
  end
  
  def test_deliver_email
    @session.expects(:send_email)
    TestPublisher.deliver_email("12451752",@user)
  end
  
  def test_create_templatized_action
    ta=TestPublisher.create_templatized_action(@user)
    assert_equal Facebooker::Feed::TemplatizedAction,ta.class
    assert_equal "Templatized Action Title",ta.title_template
    
  end
  
  def test_deliver_templatized_action
    @user.expects(:publish_action)
    TestPublisher.deliver_templatized_action(@user)
  end
  
  def test_no_sends_as_raises
    assert_raises(Facebooker::Rails::Publisher::UnspecifiedBodyType) {
      TestPublisher.deliver_no_send_as(@user)
    }
  end
  
  def test_invalid_send_as_raises
    assert_raises(Facebooker::Rails::Publisher::UnknownBodyType) {
      TestPublisher.deliver_invalid_send_as(@user)
    }
  end
  
  def test_keeps_class_method_missing
    assert_raises(NoMethodError) {
      TestPublisher.fake
    }
  end
  def test_keeps_instance_method_missing
    assert_raises(NoMethodError) {
      TestPublisher.new.fake
    }
  end
  
  def test_default_url_options
    Facebooker.expects(:facebook_path_prefix).returns("/mike")
    assert_equal({:host=>"apps.facebook.com/mike"},TestPublisher.default_url_options)
  end
  
  def test_recipients
    tp=TestPublisher.new
    tp.recipients "a"
    assert_equal("a",tp.recipients)
  end
  
end
  