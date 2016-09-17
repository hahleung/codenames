module Codenames
  module Views
    class Forms
      def self.go_to(doc, action:, method:, glyphicon:, placeholder:, post_params:, value:, tag_name:)
        doc.form action: "#{action}", method: "#{method}" do
          doc.div class: 'form-group', style: 'display: inline-flex' do
            doc.span class: "glyphicon glyphicon-#{glyphicon}", 'aria-hidden' => 'true', style: 'margin: 15px; font-size: 20px'

            doc.input type: 'text', autocomplete: 'off', class: 'form-control', style: 'width: 180px; height: 50px; margin-top: auto; margin-bottom: auto; margin-right: 15px', placeholder: "#{placeholder}", name: "#{post_params}"

            doc.input type: 'text', style: 'display: none', name: "#{tag_name}"

            Buttons.green(doc, value)
          end
        end
      end
    end
  end
end
