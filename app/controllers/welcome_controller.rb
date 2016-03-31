class WelcomeController < ApplicationController
  before_action :find_profile, only: [:dashboard, :send_invite]
  def index
  end

  def dashboard
    if params[:q].blank?
      @q = Profile.none.search
    else
      @q = Profile.joins(:user).ransack(params[:q])
    end
    @results = @q.result
  end

  def admin

  end

  def send_invite
    @token = @user.token
  end

  def send_confirm_email
    token = SecureRandom.hex.to_s
    params[:luver_id].to_i
    luver_profile = Profile.find(params[:luver_id]).user_id
    luver = User.find(luver_profile).email
    user = User.find(params[:user_id]).email

    ConfirmMailer.confirm_mailer(token, luver, user).deliver_now
    redirect_to dashboard_path, notice: "We've sent a confirmation email to your luver"

  end

  def send_invite_email
    user = User.find(params[:user]).email
    first_name = params[:first_name]
    email = params[:email]
    token = params[:token]

    if user == email
      redirect_to dashboard_path, notice: "You can't add yourself"
    else
      InviteMailer.invite_mailer(user, first_name, email, token).deliver_now
      redirect_to dashboard_path, notice: "Your invitation has been sent!"
    end

  end

  private

  def find_profile
    @user = current_user
    @profile = Profile.find_by(user_id: @user.id)
  end
end
