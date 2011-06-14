#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
ActionController::Routing::Routes.draw do |map|

  # See how all your routes lay out with "rake routes"
  map.resources :invitations
  map.resources :attacks

  
  map.resources :comments
  

  
  map.resources :dojos
  

  
  
  map.battles '', :controller=>"attacks", :action=>"index"
  

  
  map.tab '/tab',:controller=>"attacks",:action=>"tab"
  
  
  map.profile_publisher '/profile_publisher',:controller=>"profile_publisher"
  
  
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
