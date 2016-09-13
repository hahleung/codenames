require_relative '../../views/key_view.rb'

module Codenames
  class KeysController < ApplicationController
    def show
      key = Key.find(id).show_colors

      key_view = Views::Key.display(key)

      render html: key_view.html_safe, content_type: 'text/html', status: 200
    end

    private

    def id
      params.fetch('id')
    end
  end
end
