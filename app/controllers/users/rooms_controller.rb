class Users::RoomsController < ApplicationController
  def index
      @room = Room.find(params[:user_id])
    #   user_idを取得する、その中のroomsモデルを取得する
    #   roomsモデルの中のuser_idが
    #   params(user_id)と一致するレコード
  end
end
  