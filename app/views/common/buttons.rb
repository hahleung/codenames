module Codenames
  module Views
    class Buttons
      def self.go_to(doc, action:, method:, glyphicon:, value:)
        doc.form action: "#{action}", method: "#{method}" do
          doc.div class: 'form-group' do
            doc.span class: "glyphicon glyphicon-#{glyphicon}", 'aria-hidden' => 'true', style: 'margin: 15px; font-size: 20px'
            Buttons.green(doc, value)
          end
        end
      end

      def self.green(doc, value)
        doc.input type: 'submit', class: 'btn btn-success', value: "#{value}", style: 'height: 50px; width: 180px'
      end
    end
  end
end
