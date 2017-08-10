class DosesController < ApplicationController
before_action :set_dose, only: [:edit, :show, :update, :destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @dose.update(dose_params)
      redirect_to dose_path(@dose)
    else
      render :edit
    end
  end

  def destroy
    @dose.destroy

    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
