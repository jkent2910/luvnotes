class SessionsController < Devise::SessionsController
  def new
    super
    if params[:token].present?
      @user = User.find(params[:user_id].to_i)
      @luver = User.find(params[:luver_id].to_i)
      @user.luver_id = @luver.id
      @luver.luver_id = @user.id
      @user.save
      @luver.save
    end
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
  end

  def update
    super
  end
end