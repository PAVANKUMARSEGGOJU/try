#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase

  def test_hometown_when_exists
    location=Facebooker::Location.new(:city=>"Westerville", :state=>"Ohio")
    fm=flexmock(Facebooker::User)
    fm.new_instances.should_receive(:hometown_location).and_return(location)
    mike=users(:mike)
    assert_equal "Westerville Ohio",mike.hometown
  end

  def test_hometown_when_blank
    location=Facebooker::Location.new(:city=>"", :state=>"")
    fm=flexmock(Facebooker::User)
    fm.new_instances.should_receive(:hometown_location).and_return(location)
    mike=users(:mike)
    assert_equal "an undisclosed location",mike.hometown
  end

end
