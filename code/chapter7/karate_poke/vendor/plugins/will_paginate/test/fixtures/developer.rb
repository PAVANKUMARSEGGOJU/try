#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class Developer < User
  has_and_belongs_to_many :projects, :include => :topics, :order => 'projects.name'

  def self.with_poor_ones(&block)
    with_scope :find => { :conditions => ['salary <= ?', 80000], :order => 'salary' } do
      yield
    end
  end

  def self.per_page() 10 end
end
