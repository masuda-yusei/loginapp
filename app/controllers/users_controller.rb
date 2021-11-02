class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorites_counts = 0
    @user.blogs.each do |blog|
      @favorites_counts += blog.favorites.count
    end
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
