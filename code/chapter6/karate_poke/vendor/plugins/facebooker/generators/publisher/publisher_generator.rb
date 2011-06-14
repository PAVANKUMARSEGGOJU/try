#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class PublisherGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory "app/models"
      m.template "publisher.rb", "app/models/#{file_name}_publisher.rb"
      migration_file_name="create_facebook_templates"
      # unless  m.migration_exists?(migration_file_name)
      # THis should work, but it doesn't. So we re-implement it instead
      if Dir.glob(File.join(RAILS_ROOT,"db","migrate","[0-9]*_*.rb")).grep(/[0-9]+_create_facebook_templates.rb$/).blank?
        m.migration_template "create_facebook_templates.rb", "db/migrate", :migration_file_name=>migration_file_name
      end
    end
  end
  
  
end