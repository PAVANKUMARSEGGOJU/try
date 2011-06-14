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
  class Photo
    include Model
    attr_accessor :aid, :owner, :title,
                  :link, :caption, :created,
                  :src, :src_big, :src_small,
                  :story_fbid

    id_is :pid
    
    #override the generated method for id_is to use a string
    def pid=(val)
      @pid = val
    end
    
    alias :id= :pid=
  end
end
