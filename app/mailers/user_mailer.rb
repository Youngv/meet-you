class UserMailer < ApplicationMailer
  def mail_confirm(user)
    @user = user
    mail(:to => user.email, :subject => "Meet You 邮箱验证")
  end
end
