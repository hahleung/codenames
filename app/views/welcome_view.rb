require_relative './common/settings.rb'
require_relative './common/buttons.rb'
require_relative './common/forms.rb'
require_relative './common/navbar.rb'

module Codenames
  module Views
    class Welcome
      def self.display
        Nokogiri::HTML::Builder.new do |doc|
          doc.html do
            doc.head do
              Settings.set_head(doc, title: 'Welcome')
            end

            doc.body Settings.body_attributes do
              Navbar.display(doc)

              Buttons.go_to(
                doc,
                action: '/codenames/keys',
                method: 'POST',
                glyphicon: 'file',
                value: 'Generate board'
              )

              Forms.go_to(
                doc,
                action: '/codenames/retrieve_key/',
                method: 'POST',
                glyphicon: 'download',
                placeholder: 'ID of the board',
                post_params: 'public_id',
                value: 'Retrieve board',
                tag_name: 'board'
              )

              Forms.go_to(
                doc,
                action: '/codenames/retrieve_key/',
                method: 'POST',
                glyphicon: 'eye-open',
                placeholder: 'ID of the board',
                post_params: 'public_id',
                value: 'Show spy key',
                tag_name: 'key'
              )

              Settings.set_body_script(doc)
            end
          end
        end.to_html
      end
    end
  end
end
