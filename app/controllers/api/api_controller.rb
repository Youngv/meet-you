module Api
  class ApiController < ActionController::API

    private
    def authorized_user
      @current_user = request.env['authorized_user']
    end
  end
end
