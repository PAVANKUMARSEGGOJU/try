#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
plugin_root = File.join(File.dirname(__FILE__), '..')
version = ENV['RAILS_VERSION']
version = nil if version and version == ""

# first look for a symlink to a copy of the framework
if !version and framework_root = ["#{plugin_root}/rails", "#{plugin_root}/../../rails"].find { |p| File.directory? p }
  puts "found framework root: #{framework_root}"
  # this allows for a plugin to be tested outside of an app and without Rails gems
  $:.unshift "#{framework_root}/activesupport/lib", "#{framework_root}/activerecord/lib", "#{framework_root}/actionpack/lib"
else
  # simply use installed gems if available
  puts "using Rails#{version ? ' ' + version : nil} gems"
  require 'rubygems'
  
  if version
    gem 'rails', version
  else
    gem 'actionpack'
    gem 'activerecord'
  end
end

$:.unshift "#{plugin_root}/lib"
