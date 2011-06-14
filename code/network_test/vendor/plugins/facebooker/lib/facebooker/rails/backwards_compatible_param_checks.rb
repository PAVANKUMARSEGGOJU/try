#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker::Rails::BackwardsCompatibleParamChecks

    def one_or_true( value )
      case value
        when String then
          value == "1"
        when Numeric then
          value.to_f == 1.0
        when TrueClass then
          true
        else
          false
      end
    end

    def zero_or_false( value )
      case value
        when String then
          value.empty? || value == "0"
        when Numeric then
          value.to_f == 0.0
        when FalseClass then
          true
        when NilClass then
          true
        else
          false
      end
    end

end
