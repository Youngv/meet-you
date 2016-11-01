class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize_user
    unless current_user
      redirect_to(login_path, alert: '请先登录！') and return
    end

    unless current_user.email_confirmed?
      redirect_to(meetups_path, alert: '请先验证邮箱！')
    end
  end
end
