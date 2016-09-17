module Codenames
  class RetrieveKeyController < ApplicationController
    skip_before_filter :verify_authenticity_token, only: :create

    def create
      key = Key.where(public_id: public_id).first

      tag = params.keys.include?('board') ? 'board' : 'key'

      param = "id=#{key.id}&tag=#{tag}"
      redirect_to "/codenames/keys/#{param}"
    end

    def public_id
      params.fetch('public_id').to_i
    end
  end
end
