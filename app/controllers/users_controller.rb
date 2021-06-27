class UsersController < ApplicationController
  def index
    @user = current_user
    # binding.pry
  end
  
  def new
    @users = User.new
  end
 
  def create
      logger.debug("params")
      logger.debug(params.inspect)
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
  end
 
  def update
    binding.pry
      @users = User.find(params[:id])
    if @users.update(params.require(:user).permit(:name,:introduction,:email))
      flash[:notice] = "ユーザーIDが「#{@users.id}」の情報を更新しました"
      redirect_to:users
    else
      render "edit"
    end
  end
 
  def destroy
  end
      
  def profile
     @users = User.new
  end
      
  def account
    # @users = User.find(params[:id])
    @user = current_user
  end
end
