module Codenames
  module Views
    class KeyHelper
      def self.display_key(doc, key)
        key.each do |colunm|
          doc.div class: 'row', style: 'margin: auto; display: flex' do
            colunm.each do |tile|
              generate_tile_key(doc, tile)
            end
          end
        end
      end

      def self.generate_tile_key(doc, tile)
        doc.div class: 'col-sm-3 col-md-3', style: 'height: 150px; width: 150px; display: block' do
          doc.a class: 'thumbnail', style: "height: 150px; width: 150px; display: block; background-color:#{tile[:color]}" do
            doc.div style: "margin-top: 60px; margin-bottom: 60px; height: 20px; text-align: -webkit-center; padding: initial; font-size: larger; color: #{tile[:color] == 'black' ? 'white' : 'black'}" do
              doc.text "#{tile[:name]}"
            end
          end
        end
      end

      def self.display_board(doc, key)
        key.each do |colunm|
          doc.div class: 'row', style: 'margin: auto; display: flex' do
            colunm.each do |tile|
              generate_tile_board(doc, tile)
            end
          end
        end
      end

      def self.generate_tile_board(doc, tile)
        revealed_color = tile[:color] == 'white' ? 'grey' : tile[:color]

        doc.div class: 'col-sm-3 col-md-3', style: 'height: 150px; width: 150px; display: block' do
          doc.a class: 'thumbnail', style: "height: 150px; width: 150px; display: block", onclick: "this.style.backgroundColor='#{revealed_color}'" do
            doc.div style: "margin-top: 60px; margin-bottom: 60px; height: 20px; text-align: -webkit-center; padding: initial; font-size: larger; color: black" do
              doc.text "#{tile[:name]}"
            end
          end
        end
      end

      def self.display_public_id(doc, public_id)
        doc.div class: 'row', style: 'margin: auto; display: flex' do
          doc.div class: 'col-sm-3 col-md-3', style: 'margin-bottom: 15px; display: flex' do
            doc.button class: 'btn btn-warning', type: 'button' do
              doc.p 'ID of the board'
              doc.span "#{public_id}", class: 'badge'
            end
          end
        end
      end
    end
  end
end
