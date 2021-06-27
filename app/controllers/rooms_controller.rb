class RoomsController < ApplicationController
    
      def index
          @room = Room.new
      end
 
      def new
       @room = Room.new
      end
 
      def create
          logger.debug("params")
      # logger.debug(params.inspect)
        @room = Room.new(params.require(:room).permit(:room_name,:room_intro,:total_prices,:address,:begin_day,:finish_day,:people).merge(user_id:current_user.id))
    if @room.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to room_path(@room)
    else
      render "new"
    end
      end
 
      def show
      @room = Room.find(params[:id]) 
      end
 
      def edit
      end
 
      def update
        # binding.pry
        redirect_to new_reservation_path(start_date: :begin_day, end_date: :finish_day, person_num: :people, room_id: '453')
      # 部屋の更新→new_reservation_path()の引数に渡す
      end
 
      def destroy
      end
      
      def posts
        @room = Room.find(params[:id]) 
      end
      
      def reservations
        @rooms = current_user
      end
end