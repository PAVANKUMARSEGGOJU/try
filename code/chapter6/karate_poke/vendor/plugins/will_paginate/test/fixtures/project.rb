#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class Project < ActiveRecord::Base
  has_and_belongs_to_many :developers, :uniq => true
  
  has_many :topics
    # :finder_sql  => 'SELECT * FROM topics WHERE (topics.project_id = #{id})',
    # :counter_sql => 'SELECT COUNT(*) FROM topics WHERE (topics.project_id = #{id})'
  
  has_many :replies, :through => :topics do
    def find_recent(params = {})
      with_scope :find => { :conditions => ['replies.created_at > ?', 15.minutes.ago] } do
        find :all, params
      end
    end
  end
end
