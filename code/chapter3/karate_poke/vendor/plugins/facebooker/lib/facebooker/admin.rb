#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  class Admin
    def initialize(session)
      @session = session
    end
    
    # ** BETA ***
    # +properties+: Hash of properties you want to set
    def set_app_properties(properties)
      properties.respond_to?(:to_json) ? properties.to_json : properties
      (@session.post 'facebook.admin.setAppProperties', :properties => properties) == '1'
    end
    
    # ** BETA ***
    # +properties+: Hash of properties you want to view.
    def get_app_properties(*properties)
      json = @session.post('facebook.admin.getAppProperties', :properties => properties.to_json)
      hash = JSON.parse(CGI.unescapeHTML(json))
      @properties = ApplicationProperties.from_hash(hash)
    end
  
    # Integration points include..
    #   :notifications_per_day, :requests_per_day, :emails_per_day, :email_disable_message_location
    def get_allocation(integration_point)
      @session.post('facebook.admin.getAllocation', :integration_point_name => integration_point.to_s).to_i
    end    
  end
end