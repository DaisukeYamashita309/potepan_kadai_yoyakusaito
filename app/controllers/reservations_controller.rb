class ReservationsController < ApplicationController
   def index
    @reservations = Reservation.new
    @posts = Room.all
   end

  def new
    @reservation = Reservation.new(params.require(:room).permit(:begin_day, :finish_day,:room, :people,:room_id,:user_id))
    @room = Room.find(params[:room][:room_id])  
  end
 
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:begin_day, :finish_day,:room, :people,:room_id,:user_id))
    p '-----'
    p params
    p '-----'
    if @reservation.save
      flash[:notice] = "Reservation was successfully created."
      redirect_to reservation_path(@reservation)
    else
      render "new"
    end
  end
 
  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end
 
  def edit
  end
 
  def update
  end
 
  def destroy
  end
  
  def catalog
    @reservations = Reservation.all
  end
  
  private

  def sign_up_params
    # ここに :age, :genderを追記
    params.permit(:name, :email, :age, :gender, :password, :password_confirmation)
  end

  def account_update_params
    params.permit(:name, :email)
  end
end
