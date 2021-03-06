#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require 'action_controller/integration'

class Facebooker::Rails::IntegrationSession < ActionController::Integration::Session
  include Facebooker::Rails::TestHelpers
  attr_accessor :default_request_params, :canvas
  
  def process(method, path, parameters = nil, headers = nil)
    if canvas
      parameters = facebook_params(@default_request_params.merge(parameters || {}))
    end
    super method, path, parameters, headers
  end
  
  def reset!
    self.default_request_params = {:fb_sig_in_canvas => '1', :fb_sig_api_key => Facebooker::Session.api_key}.with_indifferent_access
    self.canvas = true
    super
  end
  
  def get(path, parameters = nil, headers = nil)
    if canvas
      post path, (parameters || {}).merge('fb_sig_request_method' => 'GET'), headers
    else
      super path, parameters, headers
    end
  end
  
  %w(put delete).each do |method|
    define_method method do |*args|
      if canvas
        path, parameters, headers = *args
        post path, (parameters || {}).merge('_method' => method.upcase), headers
      else
        super *args
      end
    end
  end
end
