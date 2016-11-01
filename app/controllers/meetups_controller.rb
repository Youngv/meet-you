class MeetupsController < ApplicationController
  before_action :set_meetup, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:new, :create, :update, :edit, :destroy]

  def index
    @meetups = Meetup.includes(:user).order(created_at: :desc)
  end

  def new
    @meetup = Meetup.new
  end

  def show
    @comment = Comment.new(meetup: @meetup)
    @comments = @meetup.comments.includes(:user).order(created_at: :asc).all
  end

  def edit
  end

  def create
    @meetup = Meetup.new(meetup_params)

    current_user.meetups << @meetup
    if @meetup.save
      redirect_to @meetup, notice: '聚会创建成功！'
    else
      render :new
    end
  end

  def update
    if @meetup.update(meetup_params)
      redirect_to @meetup, notice: '聚会编辑成功！'
    else
      render :edit
    end
  end

  def destroy
    @meetup.destroy
    redirect_to meetups_url, notice: '聚会删除成功！'
  end

  private
    def set_meetup
      @meetup = Meetup.find(params[:id])
    end

    def meetup_params
      params[:meetup][:date] = params[:meetup][:date].in_time_zone("Beijing")
      params.require(:meetup).permit(:title, :date, :address, :content)
    end
end
