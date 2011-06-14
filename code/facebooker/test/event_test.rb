#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.dirname(__FILE__) + '/test_helper.rb'

class EventTest< Test::Unit::TestCase
  def test_attendance_will_query_for_event_when_asked_for_full_event_object
    session = flexmock("a session object")
    eid = 123
    attendance = Facebooker::Event::Attendance.new
    attendance.eid = eid
    attendance.session = session
    event = Facebooker::Event.new
    event.eid = eid
    session.should_receive(:post).once.with('facebook.events.get', :eids => [eid]).and_return([{:eid => eid}])    
    assert_equal(123, attendance.event.eid)
  end
end