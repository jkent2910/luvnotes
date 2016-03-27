class ConfirmMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirm_mailer(token, luver, user)
    @user = user
    @token = token
    @luver = luver
    to_emails = @email

    mail(:to => to_emails,
         :subject => "#{user} has added you as a luver on LuvNotes")
  end
end