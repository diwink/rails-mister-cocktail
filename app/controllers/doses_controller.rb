class DosesController < ApplicationController
  before_action :set_cocktail

  def create
    @dose = dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
  end

  private

  def set_cocktail
    @cocktail = cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
