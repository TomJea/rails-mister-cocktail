class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    ingredient = Ingredient.find(dose_params[:ingredient_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = @cocktail
    @dose.ingredient = ingredient
    @dose.save

    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end