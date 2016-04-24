class ConfirmMailer < ActionMailer::Base
  default from: "julie@luvnotes.co"

  def confirm_mailer(token, luver, user)
    @user = user
    @token = token
    @luver = luver
    to_emails = @user

    mail(:to => to_emails,
         :subject => "#{user} has added you as a luver on LuvNotes")
  end
end