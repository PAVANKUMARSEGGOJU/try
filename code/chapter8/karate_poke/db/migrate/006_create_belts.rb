#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class CreateBelts < ActiveRecord::Migration
  def self.up
    create_table :belts do |t|
      t.string :name
      t.integer :level
      t.integer :next_belt_id
      t.integer :minimum_hits

      t.timestamps
    add_column "users", "belt_id", :integer
    add_column "moves", "difficulty_level", :integer
    end
  end

  def self.down
    drop_table :belts
    remove_column "users", "belt_id"
    remove_column "moves", "difficulty_level"
  end
end
