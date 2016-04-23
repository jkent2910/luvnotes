class InviteMailer < ActionMailer::Base
  default from: "julie@entretechno.com"

  def invite_mailer(user, first_name, email, token)
    @user = user
    @first_name = first_name
    @email = email
    @token = token
    to_emails = @email

    mail(:to => to_emails,
        :subject => "#{user} has invited you to join LuvNotes!")
  end
end