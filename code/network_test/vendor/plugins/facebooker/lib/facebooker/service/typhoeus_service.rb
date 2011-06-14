#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require 'typhoeus'
class Facebooker::Service::TyphoeusService < Facebooker::Service::BaseService
  include Typhoeus
  def post_form(url,params)
    perform_post(url.to_s,post_params(params))
  end
  
  def perform_post(url,params)
    self.class.post(url,:params=>post_params)
  end
  
  def post_multipart_form(url,params)
    raise "Multipart not supported on Typhoeus"
  end
  
  
end