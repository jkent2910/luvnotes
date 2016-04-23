class ConfirmMailer < ActionMailer::Base
  default from: "julie@entretechno.com"

  def confirm_mailer(token, luver, user)
    @user = user
    @token = token
    @luver = luver
    to_emails = @user

    mail(:to => to_emails,
         :subject => "#{user} has added you as a luver on LuvNotes")
  end
end