#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require 'action_controller/test_process'

module HTML
  class Node
    def inner_text
      children.map(&:inner_text).join('')
    end
  end
  
  class Text
    def inner_text
      self.to_s
    end
  end

  class Tag
    def inner_text
      childless?? '' : super
    end
  end
end
