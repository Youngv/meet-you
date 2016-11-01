module Api
  class MeetupsController < ApplicationController
    before_action :current_user

    def index
      @meetups = Meetup.includes(:user, :comments).order(created_at: :desc).all
    end
  end
end
