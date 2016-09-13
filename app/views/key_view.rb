require_relative './common/settings.rb'
require_relative './common/key_helper.rb'

module Codenames
  module Views
    class Key
      def self.display(key)
        Nokogiri::HTML::Builder.new do |doc|
          doc.html do
            doc.head do
              Settings.set_head(doc, title: 'Spy key')
            end

            doc.body Settings.body_attributes do
              KeyHelper.display_key(doc, key)

              Settings.set_body_script(doc)
            end
          end
        end.to_html
      end
    end
  end
end
