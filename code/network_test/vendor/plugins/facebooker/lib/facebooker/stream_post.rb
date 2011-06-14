#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class Facebooker::StreamPost
  attr_accessor :user_message, :attachment, :action_links, :target, :actor
  
  def initialize
    self.action_links = []
  end
  
  alias_method :message, :user_message
  alias_method :message=, :user_message=
  
  def action_links(*args)
    if args.blank?
      @action_links
    else
      @action_links = args.first
    end
  end
  
end