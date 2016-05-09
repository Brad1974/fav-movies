class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @message = params[:message] if params[:message]
    @message ||= false
        #raise params.inspect
  end

  def signin
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end




  private

    def user_params
      params.require(:user).permit(:name, :email, :nausea, :happiness, :height, :tickets, :admin)
    end

end
