class Users::RoomsController < ApplicationController
  def index
       @rooms = Room.where(user_id: current_user.id)
      binding.pry
    #   user_idを取得する、その中のroomsモデルを取得する
    #   roomsモデルの中のuser_idが
    #   params(user_id)と一致するレコード
  end
end
  