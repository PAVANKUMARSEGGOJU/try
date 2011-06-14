#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
dirname = File.dirname(__FILE__)
require File.join(dirname, '..', 'boot')
require File.join(dirname, 'activerecord_test_connector')

# setup the connection
ActiveRecordTestConnector.setup

# load all fixtures
fixture_path = File.join(dirname, '..', 'fixtures')
Fixtures.create_fixtures(fixture_path, ActiveRecord::Base.connection.tables)

require 'will_paginate'
WillPaginate.enable_activerecord
