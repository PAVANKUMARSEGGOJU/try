#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class PublisherGenerator < Rails::Generator::NamedBase
  def manifest
    puts banner
    exit(1)
  end
  
  def banner
    <<-EOM
    This generator has been renamed to facebook_publisher    
    please run:  #{$0} facebook_publisher
    EOM
  end
  
end