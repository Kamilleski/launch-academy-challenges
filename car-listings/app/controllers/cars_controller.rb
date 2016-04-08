class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
    @manufacturer_collection = Manufacturer.all
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Car added successfully!"
      redirect_to cars_path
    else
      flash[:error] = @car.errors.full_messages.join(". ")
      redirect_to new_car_path
    end
  end

  private

  def car_params
    params.require(:car).permit(
      :manufacturer_id,
      :color,
      :year,
      :mileage,
      :description
    )
  end
end
