#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  class Mobile
    def initialize(session)
      @session = session
    end

    # Used to determine whether the user identified by "uid" has enabled SMS for this application.
    def can_send(user)
      @session.post('facebook.sms.canSend', :uid => User.cast_to_facebook_id(user))
    end

    # Send the given message to the user.
    # See http://wiki.developers.facebook.com/index.php/Mobile
    def send(user, message)
      @session.post('facebook.sms.send', 
        {:uid => User.cast_to_facebook_id(user), 
        :message => message}, false)
    end
  end
end
