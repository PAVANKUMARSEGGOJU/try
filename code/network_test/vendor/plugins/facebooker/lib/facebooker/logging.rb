#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require 'benchmark'
module Facebooker
  @@logger = nil
  def self.logger=(logger)
    @@logger = logger
  end
  def self.logger
    @@logger
  end

  module Logging
    @skip_api_logging = nil
    class << self; attr_accessor :skip_api_logging; end

    def self.log_fb_api(method, params)
      message = method # might customize later
      dump = format_fb_params(params)
      if block_given?
        result = nil
        seconds = Benchmark.realtime { result = yield }
        log_info(message, dump, seconds) unless skip_api_logging
        result
      else
        log_info(message, dump) unless skip_api_logging
        nil
      end
    rescue Exception => e
      exception = "#{e.class.name}: #{e.message}: #{dump}"
      log_info(message, exception)
      raise
    end

    def self.format_fb_params(params)
      params.map { |key,value| "#{key} = #{value}" }.join(', ')
    end

    def self.log_info(message, dump, seconds = 0)
      return unless Facebooker.logger
      log_message = "#{message} (#{seconds}) #{dump}"
      Facebooker.logger.info(log_message)
    end
    
  end  
end
