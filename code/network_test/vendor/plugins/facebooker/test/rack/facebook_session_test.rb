#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.expand_path(File.dirname(__FILE__) + '/../test_helper')
require 'rack/facebook_session'
require 'rack/lint'
require 'rack/mock'

class Rack::FacebookSessionTest < Test::Unit::TestCase
  
  def setup
    @app = lambda do |env|
      @env = env
      Rack::Response.new().to_a
    end
    
    @facebook = Rack::FacebookSession.new(@app, lambda { '_top_sekrit' })
  end
  
  def params(p)
    p.map{|*args| args.join('=') }.join('&')
  end
  
  def app
    Rack::MockRequest.new(Rack::Lint.new(@facebook))
  end
  
  def test_converts_session_key_on_get
    response = app.get '/', :input => params(:fb_sig_session_key => 'foo')
    assert_equal '_top_sekrit=foo', @env['HTTP_COOKIE']
  end
  
  def test_converts_session_key_on_post
    response = app.post '/', :input => params(:fb_sig_session_key => 'foo')
    assert_equal '_top_sekrit=foo', @env['HTTP_COOKIE']
  end
end
