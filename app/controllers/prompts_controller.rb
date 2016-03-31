class PromptsController < ApplicationController
  before_action :set_prompt, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @prompts = Prompt.all
  end

  def show
  end

  def new
    @prompt = Prompt.new
  end

  def create
    @prompt = Prompt.new(prompt_params)

    respond_to do |format|
      if @prompt.save
        format.html { redirect_to admin_path, notice: "Prompt saved." }
        format.json { render :show, status: :created, location: @prompt}
      else
        format.html { render :new }
        format.json { render json: @prompt.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if prompt.update(prompt)
        format.html { redirect_to prompt, notice: 'Prompt updated.' }
        format.json { render :show, status: :ok, location: @prompt }
      else
        format.html { render :edit }
        format.json { render json: prompt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @prompt.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'Prompt deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_prompt
    @prompt = Prompt.find(params[:id])
  end

  def ensure_admin
    if !current_user.admin?
      redirect_to dashboard_path, notice: "You must be an admin to view"
    end
  end

  def prompt_params
    params.require(:prompt).permit(:prompt_question)
  end

end