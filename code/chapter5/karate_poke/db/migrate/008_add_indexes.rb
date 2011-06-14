#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :attacks, [:attacking_user_id, :created_at]
    add_index :attacks, [:defending_user_id, :created_at]
    add_index :users, :facebook_id
  end

  def self.down
    remove_index :attacks, [:attacking_user_id, :created_at]
    remove_index :attacks, [:defending_user_id, :created_at]
    remove_index :users, :facebook_id
  end
end
