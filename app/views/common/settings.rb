module Codenames
  module Views
    class Settings
      def self.set_head(doc, title:)
        doc.meta charset: 'utf-8'
        doc.meta 'http-equiv' => 'X-UA-Compatible', content: 'IE=edge'
        doc.meta name: "viewport", content: 'width=device-width, initial-scale=1a'
        doc.link type: 'text/css', rel: 'stylesheet', href: 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css', integrity: 'sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7', crossorigin: 'anonymous'
        doc.script src: '//code.jquery.com/jquery-1.12.0.min.js'
        doc.script src: '//code.jquery.com/jquery-migrate-1.2.1.min.js'
        doc.script src: 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js', integrity: 'sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS', crossorigin: 'anonymous'
        doc.title title
      end

      def self.body_attributes
        { role: 'document' }
      end

      def self.set_body_script(doc)
        doc.script src: "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"
      end
    end
  end
end
