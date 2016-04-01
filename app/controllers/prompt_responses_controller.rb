class PromptResponsesController < ApplicationController

  def new
    @prompt_response = PromptResponse.new
  end

  def create
    @prompt_response = PromptResponse.new(prompt_response_params)

      if @prompt_response.save
        @prompt_response.user_id = current_user.id
        @prompt_response.luver_id = User.find(current_user).luver_id
        @prompt_response.prompt_id = params[:prompt_id]
        @prompt_response.send_date = generate_random_time()
        @prompt_response.save
        redirect_to dashboard_path, notice: "Response saved."
      else
        render :new
      end
    end
  private

  def prompt_response_params
    params.require(:prompt_response).permit(:prompt_id, :user_id, :send_date, :response, :luver_id)
  end

  def generate_random_time
    date1 = DateTime.now
    date2 = DateTime.new(2016,6,1)

    time = Time.at((date2.to_time.to_f - date1.to_time.to_f)*rand + date1.to_time.to_f)
    return time
  end

end