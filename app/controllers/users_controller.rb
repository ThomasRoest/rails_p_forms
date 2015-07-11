class UsersController < ApplicationController
  def index
    if params[:activated] == "false"
      @users = User.where("activated = ?", true)

    elsif params[:activated] == "false"
      @users = User.where(activated: false)
    elsif params[:age] == "small"
      @users = User.where('age < 20')
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "user created"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :age, :activated, :born)
  end
end
