#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class AddTotalHitsToUsers < ActiveRecord::Migration
  def self.up
    add_column "users", "total_hits", :integer
  end

  def self.down
    remove_column "users", "total_hits"
  end
end
