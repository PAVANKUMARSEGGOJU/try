#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
if  RAILS_ENV=="development"
  class ActionController::Base
    def rescues_path_with_facebooker(template_name)
      t="#{RAILS_ROOT}/vendor/plugins/facebooker/templates/#{template_name}.erb"
      File.exist?(t) ? t : rescues_path_without_facebooker(template_name)
    end

    alias_method_chain :rescues_path,:facebooker

    def response_code_for_rescue(exception)
      200
    end
  end
end