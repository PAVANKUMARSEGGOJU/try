#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  class InfoItem
    include Model
    attr_accessor :label, :image, :description, :link, :sublabel
    
    def to_json
      {:label => label, :image => image, :description => description, :link => link, :sublabel => sublabel}.to_json
    end
  end
end