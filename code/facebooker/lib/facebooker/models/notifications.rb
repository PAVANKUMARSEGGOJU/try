#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  class Notifications
    include Model
    attr_accessor :messages, :group_invites, :pokes, :friend_requests, :event_invites, :shares
    
    [:Messages, :Pokes, :Shares].each do |notification_type|
      const_set(notification_type, Class.new do
        include Model
        attr_accessor :unread, :most_recent
      end)
      attribute_name = "#{notification_type.to_s.downcase}"
      define_method("#{attribute_name}=") do |value|
        instance_variable_set("@#{attribute_name}", value.kind_of?(Hash) ? Notifications.const_get(notification_type).from_hash(value) : value)
      end
    end
  end
end