#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module ActionController
  class CgiRequest
    alias :initialize_aliased_by_facebooker :initialize

    def initialize(cgi, session_options = {})
      initialize_aliased_by_facebooker(cgi, session_options)
      @cgi.instance_variable_set("@request_params", request_parameters.merge(query_parameters))
    end
    
    DEFAULT_SESSION_OPTIONS[:cookie_only] = false
  end 
end

class CGI  
  class Session
    private
      alias :initialize_aliased_by_facebooker :initialize
      attr_reader :request, :initialization_options

      def initialize(request, option={})
        @request = request
        @initialization_options = option
        option['session_id'] = set_session_id
        initialize_aliased_by_facebooker(request, option)
      end
      
      def set_session_id
        if session_key_should_be_set_with_facebook_session_key? 
          request_parameters[facebook_session_key]
        else 
          request_parameters[session_key]
        end
      end

      def request_parameters
        request.instance_variable_get("@request_params")
      end

      def session_key_should_be_set_with_facebook_session_key?
        request_parameters[session_key].blank? && !request_parameters[facebook_session_key].blank?
      end

      def session_key
        initialization_options['session_key'] || '_session_id'
      end

      def facebook_session_key
        'fb_sig_session_key'
      end

      alias :create_new_id_aliased_by_facebooker :create_new_id

      def create_new_id
        @new_session = true
        @session_id || create_new_id_aliased_by_facebooker
      end
  end
end