module Api
  class UsersController < ApiController
    before_action :authorized_user

    def create

    end

    def auth_token
      @current_user.regenerate_auth_token
      render json: {auth_token: @current_user.auth_token}
    end
  end
end