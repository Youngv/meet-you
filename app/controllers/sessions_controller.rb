class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to meetups_path, notice: '登录成功！'
    else
      flash.now[:error] = '邮箱或密码错误！'
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to meetups_path, notice: '注销成功！'
  end
end