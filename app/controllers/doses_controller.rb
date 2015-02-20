class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)

    respond_to do |format|
      if @dose.save
        format.html { redirect_to @dose, notice: 'dose was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end


  def edit
    @dose.cocktail
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:name)
    end

    def find_dose
      @dose = Dose.find(params[:id])
    end

end
