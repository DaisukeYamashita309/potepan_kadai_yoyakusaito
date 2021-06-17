class ReservationsController < ApplicationController
   def index
    @reservations = Reservation.new
   end

  def new
  end
 
  def create
     @reservations = Reservation.new(params.permit(:area))
      redirect_to rooms_path
  end
 
  def show
    @reservations = Reservation.find(params[:area])
  end
 
  def edit
  end
 
  def update
  end
 
  def destroy
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
