class LocationsController < ApplicationController

  def create
    @location = Location.new(location_params)
    @location.user_id = current_user.id
    if @location.save
      redirect_to root_path, notice: "Successfully set new location"
    else
      redirect_to root_path, notice: "Incomplete"
    end
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to root_path, notice: "Successfully set new location"
    else
      redirect_to root_path, notice: "faild.."
    end
  end

  private
  def location_params
    params.require(:location).permit(:address, :id)
  end
end
