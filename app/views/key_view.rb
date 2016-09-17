require_relative './common/settings.rb'
require_relative './common/navbar.rb'
require_relative './common/key_helper.rb'

module Codenames
  module Views
    class Key
      def self.display_spy(key)
        Nokogiri::HTML::Builder.new do |doc|
          doc.html do
            doc.head do
              Settings.set_head(doc, title: 'Spy key')
            end

            doc.body Settings.body_attributes do
              Navbar.display(doc)
              KeyHelper.display_key(doc, key)

              Settings.set_body_script(doc)
            end
          end
        end.to_html
      end

      def self.display_board(key)
        Nokogiri::HTML::Builder.new do |doc|
          doc.html do
            doc.head do
              Settings.set_head(doc, title: 'Spy key')
            end

            doc.body Settings.body_attributes do
              Navbar.display(doc)
              KeyHelper.display_board(doc, key)

              Settings.set_body_script(doc)
            end
          end
        end.to_html
      end
    end
  end
end
