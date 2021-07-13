class UsersController < ApplicationController
  def index
    @user = current_user
  end
  
  def new
    @users = User.new
  end
 
  def create
      @user = User.new(params.require(:user).permit(:name,:introduction,:img))
      # binding.pry
    if @user.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :users_index
    else
      render "new"
    end
  end

  def show
     @users = User.find(params[:id])
  end
 
  def edit
     @users = User.find(params[:id])
  end
 
  def update
    if current_user.update!(params.require(:user).permit(:name,:introduction,:image))
      flash[:notice] = "ユーザーを更新しました"
      redirect_to :users_index
    else
      render "new"
    end
  end
 
  def destroy
  end
      
  def profile
     @users = User.new
  end
      
  def account
    @user = current_user
  end
end
