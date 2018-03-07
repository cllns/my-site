# auto_register: false

require "dry/view/part"
require "commonmarker"

module Site
  module View
    module Parts
      class Article < Dry::View::Part
        def url
          external_url || "#{context.site_url}/#{path}"
        end

        def display_date
          published_at.strftime("%-m %B %Y")
        end

        def body_html
          @body_html ||= CommonMarker.render_html(body)
        end
      end
    end
  end
end
