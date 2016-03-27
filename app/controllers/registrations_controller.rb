class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def index
    super
  end

  def show
    super
  end

  def edit
    super
  end

  def create
    super
    if params[:token].present?
      @user = User.find_by(token: params[:token])
      @user.luver_id = current_user.id
      current_user.luver_id = @user.id
      @user.save
      current_user.save
    end
  end

  def update
    super
  end
end