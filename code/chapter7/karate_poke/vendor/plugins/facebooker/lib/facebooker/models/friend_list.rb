#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require 'facebooker/model'
module Facebooker
  ##
  # A simple representation of a photo album.
  class FriendList
    include Model
    attr_accessor :flid, :name
    
    # We need this to be an integer, so do the conversion
    def flid=(f)
      @flid= ( f.nil? ? nil : f.to_i)
    end
  end
end