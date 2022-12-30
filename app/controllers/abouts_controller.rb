class AboutsController < ApplicationController
  def new
    @about = About.new
  end

  def create
    @about = About.new(about_params)
    @about.user_id = current_user.id

    if @about.save
      redirect_to root_path, notice: "Successfully set profile information"
    else
      redirect_to root_path, notice: "Failed to save profile information"
    end
  end

  def edit
    @about = About.find(params[:id])
  end

  def update
    @about = About.find(params[:id])
    if @about.update(about_params)
      redirect_to root_path, notice: "Successfully updated profile information"
    else
      redirect_to root_path, notice: "Failed to update profile information"
    end
  end

  private

  def about_params
    params.require(:about).permit(:profile, :number_of_countries, :number_of_met_people, :number_of_friends)
  end

end
