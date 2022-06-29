class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations or /reservations.json
  def index
    date_includes = params[:date_includes] || Time.zone.now.strftime("%Y-%m-%d")

    @week_start_at = date_includes.to_date.beginning_of_week
    @week_end_at = date_includes.to_date.end_of_week

    @last_week_start_at_str = (@week_start_at - 1.week).strftime("%Y-%m-%d")
    @next_week_start_at_str = (@week_start_at + 1.week).strftime("%Y-%m-%d")

    @reservations = Reservation.where(start_at: @week_start_at..@week_end_at).to_a
  end

  def my_reservations
    @reservations = Reservation.where(user_id: current_user.id)
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @date = (Time.zone.parse(params[:date]) || Time.zone.now).to_date
    @start_time = params[:start_time] || "09:00"

    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id

    @reservation.start_at = Time.zone.parse("#{reservation_params[:date]} #{reservation_params[:start_time]}")
    @reservation.end_at = Time.zone.parse("#{reservation_params[:date]} #{reservation_params[:end_time]}")

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:start_at, :end_at, :purpose, :user_id, :date, :start_time, :end_time)
    end
end
