class UsersController < ApplicationController
  def index
    @users = User.new
  end
  
  def new
    @users = User.new
  end
 
  def create
      logger.debug("params")
      logger.debug(params.inspect)
        @users = User.new(params.require(:user).permit(:name,:introduction,:photo))
    if @users.save
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
     @users = User.find(params[:id])
  end
end
