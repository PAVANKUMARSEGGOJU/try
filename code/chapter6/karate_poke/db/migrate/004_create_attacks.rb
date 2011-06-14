#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class CreateAttacks < ActiveRecord::Migration
  def self.up
    create_table :attacks do |t|
      t.integer :attacking_user_id
      t.integer :defending_user_id
      t.integer :move_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attacks
  end
end
