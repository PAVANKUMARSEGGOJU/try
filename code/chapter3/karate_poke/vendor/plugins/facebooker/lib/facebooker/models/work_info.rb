#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  class WorkInfo
    include Model
    attr_accessor :end_date, :start_date, :company_name, :description, :position, :location
    def location=(location)
      @location = location.kind_of?(Hash) ? Location.from_hash(location) : location
    end
  end
end