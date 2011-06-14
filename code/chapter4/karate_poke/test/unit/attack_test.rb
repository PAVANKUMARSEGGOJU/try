#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'

class AttackTest < ActiveSupport::TestCase

  fixtures :users, :moves  
  def setup
    @attack = Attack.new(:attacking_user=>users(:jen),
                        :defending_user=>users(:mike),
                        :move=>moves(:chop))
  end

  def test_valid
    assert @attack.valid?
  end

  def test_attack_requires_attacking_user
    @attack.attacking_user=nil
    assert !@attack.valid?
  end

  def test_attack_requires_defending_user
    @attack.defending_user=nil
    assert !@attack.valid?
  end

  def test_attack_requires_move
    @attack.move=nil
    assert !@attack.valid?
  end

end
