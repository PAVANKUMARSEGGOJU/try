#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require 'net/http'
require 'facebooker/parser'
module Facebooker
  class Service
    def initialize(api_base, api_path, api_key)
      @api_base = api_base
      @api_path = api_path
      @api_key = api_key
    end
    
    # TODO: support ssl 
    def post(params)
      Parser.parse(params[:method], Net::HTTP.post_form(url, params))
    end
    
    def post_file(params)
      Parser.parse(params[:method], Net::HTTP.post_multipart_form(url, params))
    end
    
    private
    def url
      URI.parse('http://'+ @api_base + @api_path)
    end
  end
end