#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class CreateMoves < ActiveRecord::Migration
  def self.up
    create_table :moves do |t|
      t.string :name
      t.string :image_name

      t.timestamps
    end
  end

  def self.down
    drop_table :moves
  end
end
