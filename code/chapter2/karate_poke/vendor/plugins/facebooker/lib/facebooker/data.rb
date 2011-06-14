#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  class Data
    def initialize(session)
      @session = session
    end
    
    ##
    # ** BETA ***
    # Sets a cookie on Facebook
    # +user+ The user for whom this cookie needs to be set.
    # +name+ Name of the cookie
    # +value+ Value of the cookie
    # Optional:
    # +expires+ Time when the cookie should expire. If not specified, the cookie never expires. 
    # +path+ Path relative to the application's callback URL, with which the cookie should be associated. (default value is /?
    def set_cookie(user, name, value, expires=nil, path=nil)
      @session.post('facebook.data.setCookie', 
        :uid => User.cast_to_facebook_id(user), 
        :name => name, 
        :value => value, 
        :expires => expires, 
        :path => path) {|response| response == '1'}
    end
    
    ##
    # ** BETA ***
    # Gets a cookie stored on Facebook
    # +user+	The user from whom to get the cookies.	
    # Optional:   
    # +name+ The name of the cookie. If not specified, all the cookies for the given user get returned.
    def get_cookies(user, name=nil)
      @cookies = @session.post( 
        'facebook.data.getCookies', :uid => User.cast_to_facebook_id(user), :name => name) do |response|
          response.map do |hash|
            Cookie.from_hash(hash)
          end
      end
    end    
  end
end