require_relative './buttons.rb'

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

      def self.tile_color(tile)
        case tile[:color]
        when 'white'
          '#7f8c8d'
        when 'blue'
          '#337ab7'
        when 'red'
          '#d9534f'
        when 'black'
          'black'
        end
      end

      def self.generate_tile_key(doc, tile)
        background_color = tile_color(tile)

        doc.div class: 'col-sm-3 col-md-3', style: 'height: 150px; width: 150px; display: block' do
          doc.a class: 'thumbnail', style: "height: 150px; width: 150px; display: block; background-color:#{background_color}" do
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
        color = tile_color(tile)
        id = "tile" + tile[:position].join

        doc.div class: 'col-sm-3 col-md-3', style: 'height: 150px; width: 150px; display: block' do
          doc.a class: 'thumbnail', style: "height: 150px; width: 150px; display: block", onclick: "reveal(this, '#{color}')", onmouseover: "over(this, #{id})", onmouseout: "not_over(this, #{id})" do
            doc.div style: "margin-top: 60px; margin-bottom: 60px; height: 20px; text-align: -webkit-center; padding: initial; font-size: larger; color: black" do
              doc.text tile[:name]
              doc.p tile[:french_translation], id: id, style: "display: none"
            end
          end
        end
      end

      def self.display_board_params(doc, parameters)
        public_id = parameters[:public_id]
        first_team = parameters[:first_team]
        red_tiles = first_team == 'Red' ? 9 : 8
        blue_tiles = first_team == 'Blue' ? 9 : 8

        doc.div class: 'row', style: 'margin: auto; display: flex' do
          doc.div class: 'col-sm-3 col-md-3', style: 'margin-bottom: 15px; display: flex; width: 100%' do
            Buttons.parameters(
              doc,
              'success',
              'ID of the board',
              public_id
            )

            Buttons.parameters(
              doc,
              'warning',
              'First team to start',
              first_team
            )

            Buttons.parameters(
              doc,
              'primary',
              'Blue tiles',
              blue_tiles
            )

            Buttons.parameters(
              doc,
              'danger',
              'Red tiles',
              red_tiles
            )
          end
        end
      end
    end
  end
end
