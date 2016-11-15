module Api
  class MeetupsController < ApiController
    before_action :authorized_user

    def index
      @meetups = Meetup.includes(:user, :comments).order(created_at: :desc).all
    end
  end
end
