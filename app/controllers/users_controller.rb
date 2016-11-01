class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.mail_confirm(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to meetups_path, notice: '注册成功，已经向你的邮箱发送一封验证邮件！'
    else
      render :new
    end
  end

  def confirm_email
    user = User.find_by!(confirm_token: params[:token])
    user.update(confirmed_at: Time.now)
    session.clear
    redirect_to login_path, notice: '邮箱验证成功，请重新登录！'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
