#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class Facebooker::Service::BaseService
  def parse_results?
    true
  end
  
  def post_params(params)
    post_params = {}
    params.each do |k,v|
      k = k.to_s unless k.is_a?(String)
      if Array === v || Hash === v
        post_params[k] = Facebooker.json_encode(v)       
      else
        post_params[k] = v
      end
    end
    post_params
  end
  
end
