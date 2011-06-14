#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class XdReceiverGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.template "xd_receiver.html",     "public/xd_receiver.html"
      m.template "xd_receiver_ssl.html", "public/xd_receiver_ssl.html"
    end
  end
  
  
end
