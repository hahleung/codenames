require_relative '../../views/welcome_view.rb'

module Codenames
  class WelcomeController < ApplicationController
    def index
      welcome_view = Views::Welcome.display

      render html: welcome_view.html_safe, content_type: 'text/html', status: 200
    end
  end
end
