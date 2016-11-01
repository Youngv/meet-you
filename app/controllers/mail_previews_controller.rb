class MailPreviewsController < ApplicationController
  def mail_confirm
    @user = User.find(params[:id])
    render file: 'user_mailer/mail_confirm', layout: 'mailer'
  end
end