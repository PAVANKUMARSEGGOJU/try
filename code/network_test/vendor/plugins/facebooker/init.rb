#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
# Added support to the Facebooker.yml file for switching to the new profile design..
# Config parsing needs to happen before files are required.
facebook_config = "#{RAILS_ROOT}/config/facebooker.yml"

require 'facebooker'
FACEBOOKER = Facebooker.load_configuration(facebook_config)

# enable logger before including everything else, in case we ever want to log initialization
Facebooker.logger = RAILS_DEFAULT_LOGGER if Object.const_defined? :RAILS_DEFAULT_LOGGER

require 'net/http_multipart_post'
if defined? Rails
  require 'facebooker/rails/backwards_compatible_param_checks'
  require 'facebooker/rails/controller'
  require 'facebooker/rails/facebook_url_rewriting'
  require 'facebooker/rails/facebook_session_handling' if Rails.version < '2.3'
  require 'facebooker/rails/facebook_request_fix' if Rails.version < '2.3'
  require 'facebooker/rails/facebook_request_fix_2-3' if Rails.version >= '2.3'
  require 'facebooker/rails/routing'
  require 'facebooker/rails/facebook_pretty_errors' rescue nil
  require 'facebooker/rails/facebook_url_helper'
  require 'facebooker/rails/extensions/rack_setup' if Rails.version > '2.3'
  require 'facebooker/rails/extensions/action_controller'
  #require 'facebooker/rails/extensions/action_view'
  require 'facebooker/rails/extensions/routing'
end
