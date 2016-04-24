class PromptMailer < ApplicationMailer

  def prompt_mailer(user, luver, email)
    @user = user
    @luver = luver
    @email = email

    mail(from: 'julie@entretechno.com',
          to: @email,
          subject: 'You have a Luv Note waiting!')
  end

end
