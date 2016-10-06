module Codenames
  module Views
    class Navbar
      def self.display(doc)
        doc.nav class: "navbar navbar-default" do
          doc.div class: "container-fluid" do
            doc.div class: "navbar-header" do
              doc.button type: "button", class: "navbar-toggle collapsed", 'data-toggle' => "collapse", 'data-target' => "#bs-example-navbar-collapse-1", 'aria-expanded' => "true"
              doc.span class: "sr-only" do
                doc.p 'Home'
              end
              doc.span class: "icon-bar"
              doc.span class: "icon-bar"
              doc.span class: "icon-bar"
            end
            doc.a class: "navbar-brand", href: "#" do
              doc.h1 'NADECOMES', style: 'display: inline'
            end
          end

          doc.div class: "collapse navbar-collapse", id: "bs-example-navbar-collapse-1" do
            doc.ul  class: "nav navbar-nav" do
              Navbar.glyphicon_text(
                doc,
                href: '/codenames/welcome',
                glyphi: 'home',
                text: 'Home'
              )
              Navbar.glyphicon_text(
                doc,
                href: '/codenames/keys',
                glyphi: 'pencil',
                text: 'New board'
              )
              Navbar.glyphicon_text(
                doc,
                href: '/codenames/welcome',
                glyphi: 'download',
                text: 'Retrieve board'
              )
              Navbar.glyphicon_text(
                doc,
                href: '/codenames/welcome',
                glyphi: 'eye-open',
                text: 'Show spy'
              )
              Navbar.glyphicon_text(
                doc,
                href: 'https://en.wikipedia.org/wiki/Codenames_(board_game)',
                glyphi: 'book',
                text: 'Rules'
              )
            end

            doc.ul  class: "nav navbar-nav navbar-right" do
              doc.li class: "dropdown" do
                doc.a href: "#", class: "dropdown-toggle", 'data-toggle' => "dropdown", role: "button", 'aria-haspopup' => "true", 'aria-expanded' => "false" do
                  doc.span class: "glyphicon glyphicon-info-sign", 'aria-hidden' => 'true', style: 'margin: 15px; font-size: 20px'
                  doc.p 'About', style: 'text-align: center'
                  doc.span class: 'caret'
                end
                doc.ul class: "dropdown-menu" do
                  doc.li do doc.a href: "#" do doc.p 'Original game' end end
                  doc.li  role: "separator", class: "divider"
                  doc.li do doc.a href: "#" do doc.p 'Back-end specs' end end
                  doc.li do doc.a href: "#" do doc.p 'Front-end specs' end end
                  doc.li do doc.a href: "#" do doc.p 'Code source' end end
                end
              end
            end
          end
        end

      end

      private

      def self.glyphicon_text(doc, href:, glyphi:, text:)
        doc.li  class: "active" do
          doc.li do
            doc.a href: "#{href}" do
              doc.div style: 'display: table-caption' do
                doc.span class: "glyphicon glyphicon-#{glyphi}", 'aria-hidden' => 'true', style: 'margin: 15px; font-size: 20px'
                doc.p "#{text}", style: 'text-align: center'
              end
            end
          end
        end
      end
    end
  end
end
