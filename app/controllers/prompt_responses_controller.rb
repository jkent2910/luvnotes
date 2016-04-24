class PromptResponsesController < ApplicationController

  before_filter :ensure_time, only: [:show]
  before_filter :ensure_luver, only: [:show]

  def new
    @prompt_response = PromptResponse.new
  end

  def create
    @prompt_response = PromptResponse.new(prompt_response_params)

      if @prompt_response.save
        user = @prompt_response.user_id = current_user.id
        luver = @prompt_response.luver_id = User.find(current_user).luver_id
        @prompt_response.prompt_id = params[:prompt_id]
        @prompt_response.send_date = generate_random_time()
        @prompt_response.save

        user = User.find(user)
        luver = User.find(luver)
        email = luver.email
        prompt_response_date = @prompt_response.send_date

        PromptMailer.prompt_mailer(user, luver, email).deliver_later(wait_until: prompt_response_date)

        redirect_to dashboard_path, notice: "Response saved."
      else
        render :new
      end
  end

  def show
    @prompt_response = PromptResponse.find(params[:id])

    @prompt = Prompt.find(params[:prompt_id])

    @luver = Profile.find_by(user_id: @prompt_response.user_id).full_name
  end

  private

  def prompt_response_params
    params.require(:prompt_response).permit(:prompt_id, :user_id, :send_date, :response, :luver_id)
  end

  def generate_random_time
    date1 = DateTime.now
    date2 = DateTime.new(2016,4,24)

    time = Time.at((date2.to_time.to_f - date1.to_time.to_f)*rand + date1.to_time.to_f)
    return time
  end

  def ensure_time
    @prompt_response = PromptResponse.find(params[:id])
    if Time.now.to_i <= @prompt_response.send_date.to_i
      redirect_to dashboard_path, notice: "You cannot view this prompt response because it's not time yet"
    end
  end

  def ensure_luver
    @prompt_response = PromptResponse.find(params[:id])
    if @prompt_response.luver_id != current_user.id
      redirect_to dashboard_path, notice: "You cannot view this prompt response because you're not the luver"
    end
  end

end