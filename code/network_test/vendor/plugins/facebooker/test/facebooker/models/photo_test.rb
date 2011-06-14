#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.expand_path(File.dirname(__FILE__) + '/../../test_helper')
require 'active_support'

class Facebooker::UserTest < Test::Unit::TestCase

  def test_pid_should_be_treated_as_a_string
    @photo = Facebooker::Photo.new(:pid=>"100000025509592_6801")
    assert_equal("100000025509592_6801",@photo.pid)
  end
  
  def test_setting_id_should_also_use_new_method
    @photo = Facebooker::Photo.new(:id=>"100000025509592_6801")
    assert_equal("100000025509592_6801",@photo.id)
  end

end