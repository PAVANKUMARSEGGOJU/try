#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'

class BeltTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  fixtures :belts
  def test_cant_upgrade_past_last_belt
    assert !Belt.new.should_be_upgraded?(users(:jen))
  end
  
  def test_should_upgrade_if_next_belt_matches
    j=users(:jen)
    j.total_hits = 5
    assert belts(:white).should_be_upgraded?(j)
  end
  
  def test_should_not_upgrade_if_next_belt_needs_more_hits
    j=users(:jen)
    j.total_hits = 4
    assert !belts(:white).should_be_upgraded?(j)
  end
end
