#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
$: << File.join(File.dirname(__FILE__), "..", 'lib')
require 'facebooker'
load "~/.facebooker" rescue fail("You'll need to specify API_KEY and SECRET_KEY to run this example.  One way to do that would be to put them in ~/.facebooker")
session = Facebooker::Session::Desktop.create(API_KEY, SECRET_KEY)
puts session.login_url
gets

session.user.friends!.each do |user|
  puts "#{user.id}:#{user.name}"
end
# This time all the data is there because friends! has already retrieved it.
session.user.friends.each do |user|
    puts "#{user.id}:#{user.name}"
end