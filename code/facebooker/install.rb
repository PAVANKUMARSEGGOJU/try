#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require 'fileutils'

facebook_config = File.dirname(__FILE__) + '/../../../config/facebooker.yml'
FileUtils.cp File.dirname(__FILE__) + '/facebooker.yml.tpl', facebook_config unless File.exist?(facebook_config)
puts IO.read(File.join(File.dirname(__FILE__), 'README'))