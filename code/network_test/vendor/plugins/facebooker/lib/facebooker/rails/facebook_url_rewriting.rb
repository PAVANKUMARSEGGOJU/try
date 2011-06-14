#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module ::ActionController
  if Rails.version < '2.3'
    class AbstractRequest
      def relative_url_root
        Facebooker.path_prefix
      end
    end
  else
    class Request
      def relative_url_root
        Facebooker.path_prefix
      end
    end
  end

  class Base
    class << self
      alias :old_relative_url_root :relative_url_root
      def relative_url_root
        Facebooker.path_prefix
      end
    end
  end

  class UrlRewriter
    include Facebooker::Rails::BackwardsCompatibleParamChecks

    RESERVED_OPTIONS << :canvas

    def link_to_new_canvas?
      one_or_true @request.parameters["fb_sig_in_new_facebook"]
    end

    def link_to_canvas?(params, options)
      option_override = options[:canvas]
      return false if option_override == false # important to check for false. nil should use default behavior
      option_override || (can_safely_access_request_parameters? && (one_or_true(@request.parameters["fb_sig_in_canvas"]) || one_or_true(@request.parameters[:fb_sig_in_canvas]) || one_or_true(@request.parameters["fb_sig_is_ajax"]) ))
    end

    #rails blindly tries to merge things that may be nil into the parameters. Make sure this won't break
    def can_safely_access_request_parameters?
      @request.request_parameters
    end
  
    def rewrite_url_with_facebooker(*args)
      options = args.first.is_a?(Hash) ? args.first : args.last
      is_link_to_canvas = link_to_canvas?(@request.request_parameters, options)
      if is_link_to_canvas && !options.has_key?(:host)
        options[:host] = Facebooker.canvas_server_base
      end 
      options.delete(:canvas)
      Facebooker.request_for_canvas(is_link_to_canvas) do
        rewrite_url_without_facebooker(*args)
      end
    end
    
    alias_method_chain :rewrite_url, :facebooker

  end
end
