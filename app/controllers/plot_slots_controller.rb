class PlotSlotsController < ApplicationController
  before_action :set_plot_slot, only: %i[ show edit update destroy ]

  # GET /plot_slots or /plot_slots.json
  def index
    @plot_slots = PlotSlot.all
  end

  # GET /plot_slots/1 or /plot_slots/1.json
  def show
  end

  # GET /plot_slots/new
  def new
    @plot_slot = PlotSlot.new
  end

  # GET /plot_slots/1/edit
  def edit
  end

  # POST /plot_slots or /plot_slots.json
  def create
    @plot_slot = PlotSlot.new(plot_slot_params)

    respond_to do |format|
      if @plot_slot.save
        format.html { redirect_to @plot_slot, notice: "Plot slot was successfully created." }
        format.json { render :show, status: :created, location: @plot_slot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plot_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plot_slots/1 or /plot_slots/1.json
  def update
    respond_to do |format|
      if @plot_slot.update(plot_slot_params)
        format.html { redirect_to @plot_slot, notice: "Plot slot was successfully updated." }
        format.json { render :show, status: :ok, location: @plot_slot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plot_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plot_slots/1 or /plot_slots/1.json
  def destroy
    @plot_slot.destroy
    respond_to do |format|
      format.html { redirect_to plot_slots_url, notice: "Plot slot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plot_slot
      @plot_slot = PlotSlot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plot_slot_params
      params.require(:plot_slot).permit(:user_profile_id, :x, :y, :flower_type_id, :when_planted, :when_watered)
    end
end
