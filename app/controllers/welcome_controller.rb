class WelcomeController < ApplicationController
  before_action :find_profile, only: [:dashboard, :send_invite]

  before_action :check_luver_status, only: [:send_confirm_email]

  def index
  end

  def dashboard
    if params[:q].blank?
      @q = Profile.none.search
    else
      @q = Profile.joins(:user).ransack(params[:q])
    end
    @results = @q.result

    @response_count = PromptResponse.where(user_id: current_user.id).count

    @received_count = PromptResponse.where("luver_id = ? AND send_date <= ?", current_user.id, Date.today()).count

    @luv_notes_ready = []
    PromptResponse.where("luver_id = ? AND send_date <= ? AND send_date >= ?", current_user.id, Date.today(), Date.today - 7).each do |response|
      @luv_notes_ready << response
    end

    all_prompts = []

    PromptResponse.find_each do |response|
      if response.user_id == current_user.id
        prompt_to_remove = Prompt.find(response.prompt_id)
        all_prompts << prompt_to_remove
      end
    end

    prompts = Arel::Table.new(:prompts)

    @prompts = Prompt.where(prompts[:id].not_in all_prompts)

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

  def check_luver_status
    params[:luver_id].to_i
    luver_profile = Profile.find(params[:luver_id]).user_id
    luver = User.find(luver_profile)
    p luver
    if luver.luver_id != nil
      redirect_to dashboard_path, notice: "This person already has a luver"
    end
  end
end
