class FlowerTypesController < ApplicationController
  before_action :set_flower_type, only: %i[ show edit update destroy ]

  # GET /flower_types or /flower_types.json
  def index
    @flower_types = FlowerType.all
  end

  # GET /flower_types/1 or /flower_types/1.json
  def show
  end

  # GET /flower_types/new
  def new
    @flower_type = FlowerType.new
  end

  # GET /flower_types/1/edit
  def edit
  end

  # POST /flower_types or /flower_types.json
  def create
    @flower_type = FlowerType.new(flower_type_params)

    respond_to do |format|
      if @flower_type.save
        format.html { redirect_to @flower_type, notice: "Flower type was successfully created." }
        format.json { render :show, status: :created, location: @flower_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flower_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flower_types/1 or /flower_types/1.json
  def update
    respond_to do |format|
      if @flower_type.update(flower_type_params)
        format.html { redirect_to @flower_type, notice: "Flower type was successfully updated." }
        format.json { render :show, status: :ok, location: @flower_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flower_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flower_types/1 or /flower_types/1.json
  def destroy
    @flower_type.destroy
    respond_to do |format|
      format.html { redirect_to flower_types_url, notice: "Flower type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flower_type
      @flower_type = FlowerType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flower_type_params
      params.require(:flower_type).permit(:name, :color, :growth_duration_seconds, :buy_price, :sell_price, :max_water_interval, :harvest_duration_seconds, :graphic)
    end
end
