class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to dashboard_path, notice: "Great!  Thanks for joining!" }
        format.json { render :show, status: :created, location: @profile}
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if profile.update(profile_params)
        format.html { redirect_to profile, notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: 'Your profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :gender, :birthday, :city, :state)
  end

end