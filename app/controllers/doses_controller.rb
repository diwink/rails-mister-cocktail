class DosesController < ApplicationController
  def create
    @cocktail = cocktail.find(params[:cocktail_id])
    @dose = dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
