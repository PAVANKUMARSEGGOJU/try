#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require 'cucumber/rails/world'
require 'facebooker/rails/integration_session'

module Facebooker
  module Rails
    module Cucumber
      def open_session
        session = Facebooker::Rails::IntegrationSession.new

        # delegate the fixture accessors back to the test instance
        extras = Module.new { attr_accessor :delegate, :test_result }
        if self.class.respond_to?(:fixture_table_names)
          self.class.fixture_table_names.each do |table_name|
            name = table_name.tr(".", "_")
            next unless respond_to?(name)
            extras.__send__(:define_method, name) { |*args| delegate.send(name, *args) }
          end
        end

        # delegate add_assertion to the test case
        extras.__send__(:define_method, :add_assertion) { test_result.add_assertion }
        session.extend(extras)
        session.delegate = self
        session.test_result = @_result

        yield session if block_given?
        session
      end
      
      def without_canvas
        in_canvas = @integration_session.canvas
        @integration_session.canvas = false
        yield
        @integration_session.canvas = in_canvas
      end
    end
  end
end

World(Facebooker::Rails::Cucumber)
