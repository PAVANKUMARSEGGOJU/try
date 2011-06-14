#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class ActionController::Routing::Route
  def recognition_conditions_with_facebooker
    defaults = recognition_conditions_without_facebooker 
    defaults << " env[:canvas] == conditions[:canvas] " if conditions[:canvas]
    defaults
  end
  alias_method_chain :recognition_conditions, :facebooker
end

# We turn off route optimization to make named routes use our code for figuring out if they should go to the session
ActionController::Base::optimise_named_routes = false 

# pull :canvas=> into env in routing to allow for conditions
ActionController::Routing::RouteSet.send :include,  Facebooker::Rails::Routing::RouteSetExtensions
ActionController::Routing::RouteSet::Mapper.send :include, Facebooker::Rails::Routing::MapperExtensions
