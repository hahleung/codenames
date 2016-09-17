require_relative '../../views/key_view.rb'

module Codenames
  class KeysController < ApplicationController
    skip_before_filter :verify_authenticity_token, :only => :create

    def create
      key = Key.generate

      redirect_to "/codenames/keys/#{key.id}"
    end

    def show
      key = Key.find(id).show_colors

      key_view = if tag == 'key'
                   Views::Key.display_spy(key)
                 else
                   Views::Key.display_board(key)
                 end

      render html: key_view.html_safe, content_type: 'text/html', status: 200
    end

    private

    def customed_param
      params.fetch('id').split('&').map do |param|
        key, value = param.split('=')
        {key => value}
      end.reduce({}) { |acc, ite| acc.merge(ite) }
    end

    def id
      if customed_param.keys.include?('id')
        customed_param.fetch('id')
      else
        params.fetch('id')
      end
    end

    def tag
      return customed_param.fetch('tag') if customed_param.keys.include?('tag')
    end
  end
end
