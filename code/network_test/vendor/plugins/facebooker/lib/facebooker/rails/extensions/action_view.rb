#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class ActionView::PathSet

  # Try to find fbml version if the format is fbjs
  def find_template_with_facebooker(original_template_path, format = nil, html_fallback = true)
    find_template_without_facebooker(original_template_path, format, html_fallback)
  rescue ActionView::MissingTemplate
    template_path = original_template_path.sub(/^\//, '')

    each do |load_path|
     if format == :fbjs && html_fallback && template = load_path["#{template_path}.#{I18n.locale}.fbml"]
        return template
      elsif format == :fbjs && html_fallback && template = load_path["#{template_path}.fbml"]
        return template
      end

      raise MissingTemplate.new(self, original_template_path, format)
    end
  end

  alias_method_chain :find_template, :facebooker
end
