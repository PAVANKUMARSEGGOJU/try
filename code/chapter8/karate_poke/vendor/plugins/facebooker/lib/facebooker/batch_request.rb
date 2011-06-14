#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
module Facebooker
  class BatchRequest
    instance_methods.each { |m| undef_method m unless m =~ /(^__|^nil\?$|^send$|proxy_|^respond_to\?$|^new$)/ }
    attr_reader :uri
    attr_reader :method
    class UnexecutedRequest < StandardError; end
    def initialize(params,proc)
      @method=params[:method]
      @uri=params.map{|k,v| "#{k}=#{CGI.escape(v.to_s)}"}.join("&")
      @proc=proc
    end
  
    def result=(result_object)
      @result = @proc.nil? ? result_object : @proc.call(result_object)
    end
    
    def exception_raised=(ex)
      @exception=ex
    end
    
    def exception_raised?
      @exception.nil? ? false : raise(@exception)
    end

    def respond_to?(name)
      super || @result.respond_to?(name)
    end
  
    def ===(other)
      other === @result
    end
  
  
    def method_missing(name,*args,&proc)
      if @exception
        raise @exception
      elsif @result.nil?
        raise UnexecutedRequest.new("You must execute the batch before accessing the result: #{@uri}")
      else
        @result.send(name,*args,&proc)
      end
    end
  end
end