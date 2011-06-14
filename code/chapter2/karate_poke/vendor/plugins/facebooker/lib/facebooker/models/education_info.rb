#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  class EducationInfo
    class HighschoolInfo
      include Model
      attr_accessor :hs1_id, :hs2_id, :grad_year, :hs1_name, :hs2_name
    end
    
    include Model
    attr_accessor :concentrations, :name, :year, :degree
  end
end