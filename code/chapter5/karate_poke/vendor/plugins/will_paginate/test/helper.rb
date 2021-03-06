#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require 'test/unit'
require 'rubygems'

# gem install redgreen for colored test output
begin require 'redgreen'; rescue LoadError; end

require File.join(File.dirname(__FILE__), 'boot') unless defined?(ActiveRecord)

class Test::Unit::TestCase
  protected
  def assert_respond_to_all object, methods
    methods.each do |method|
      [method.to_s, method.to_sym].each { |m| assert_respond_to object, m }
    end
  end
end

# Wrap tests that use Mocha and skip if unavailable.
def uses_mocha(test_name)
  require 'mocha' unless Object.const_defined?(:Mocha)
  yield
rescue LoadError => load_error
  raise unless load_error.message =~ /mocha/i
  $stderr.puts "Skipping #{test_name} tests. `gem install mocha` and try again."
end
