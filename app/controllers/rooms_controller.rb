class RoomsController < ApplicationController
    
      def index
       @room = Room.new
      end
 
      def new
       @room = Room.new
      end
 
      def create
        @room = Room.new(params.require(:room).permit(:room_name,:room_intro,:total_prices,:address,:begin_day,:finish_day,:people,:image,:id).merge(user_id:current_user.id))
    if @room.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to room_path(@room)
    else
      render "new"
    end
      end
 
      def show
      params.permit(:image,:id,:begin_day,:finish_day,:people,:room_id)
      @room = Room.find(params[:id]) 
      # @reservation = Reservation.find(params[:id])
      @user = current_user
      end
 
      def edit
      end
 
      def update
        @room = Room.find(params[:id]) 
        redirect_to reservation_path(start_date: :begin_day, end_date: :finish_day, person_num: :people, room_id: '453')
      # 部屋の更新→new_reservation_path()の引数に渡す
      end
 
      def destroy
      end
      
      def posts
        @rooms = Room.all
      end
      
      def reservations
        @room = Room.all
        @reservation = Reservation.all
        @rooms = current_user
      end
      
      def search
      
        if params[:address].present? && params[:keyword].present?
           @rooms = Room.where('address LIKE ? and (room_intro LIKE ? or room_name LIKE ?)', "%#{params[:address]}%","%#{params[:keyword]}%","%#{params[:keyword]}%")
        elsif params[:address].present?
           @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
        elsif params[:keyword].present?
           @rooms = Room.where('room_intro LIKE ? or room_name LIKE ?', "%#{params[:keyword]}%","%#{params[:keyword]}%")
        else
           @rooms = Room.all
        end
      
      end
end