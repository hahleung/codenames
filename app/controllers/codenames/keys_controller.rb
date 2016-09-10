module Codenames
  class KeysController < ApplicationController
    def show
      key = Key.find(id)

      render json: key, status: 200
    end

    private

    def id
      params.fetch 'id'
    end
  end
end
