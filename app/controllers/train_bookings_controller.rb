class TrainBookingsController < ApplicationController
  before_action :set_train_booking, only: [:show, :edit, :update, :destroy]

  # GET /train_bookings
  def index
    @train_bookings = TrainBooking.all
  end

  # GET /train_bookings/1
  def show
  end

  # GET /train_bookings/new
  def new
    @train_booking = TrainBooking.new
  end

  # GET /train_bookings/1/edit
  def edit
  end

  # POST /train_bookings
  def create
    @train_booking = TrainBooking.new(train_booking_params)

    if @train_booking.save
      redirect_to @train_booking, notice: 'Train booking was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /train_bookings/1
  def update
    if @train_booking.update(train_booking_params)
      redirect_to @train_booking, notice: 'Train booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /train_bookings/1
  def destroy
    @train_booking.destroy
    redirect_to train_bookings_url, notice: 'Train booking was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train_booking
      @train_booking = TrainBooking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def train_booking_params
      params.require(:train_booking).permit(:from, :to, :date_from, :date_to, :time_from, :time_to)
    end
end
