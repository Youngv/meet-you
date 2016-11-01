module Api
  class ApplicationController < ActionController::API
    def current_user
      @current_user = request.env['authorized_user']
    end
  end
end
