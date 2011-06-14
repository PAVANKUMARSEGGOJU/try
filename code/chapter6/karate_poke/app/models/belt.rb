#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class Belt < ActiveRecord::Base
  
  belongs_to :next_belt, :class_name=>"Belt", :foreign_key=>:next_belt_id
  

  
  def self.initial_belt
    find_by_level(1)
  end
  
  
  
  def should_be_upgraded?(user)
    !next_belt.nil? and user.total_hits >= next_belt.minimum_hits 
  end
	
	
end
