class OwnedSeedsController < ApplicationController
  before_action :set_owned_seed, only: %i[ show edit update destroy ]

  # GET /owned_seeds or /owned_seeds.json
  def index
    @owned_seeds = OwnedSeeds.all
  end

  # GET /owned_seeds/1 or /owned_seeds/1.json
  def show
  end

  # GET /owned_seeds/new
  def new
    @owned_seed = OwnedSeeds.new
  end

  # GET /owned_seeds/1/edit
  def edit
  end

  # POST /owned_seeds or /owned_seeds.json
  def create
    @owned_seed = OwnedSeeds.new(owned_seed_params)

    respond_to do |format|
      if @owned_seed.save
        format.html { redirect_to @owned_seed, notice: "Owned seeds was successfully created." }
        format.json { render :show, status: :created, location: @owned_seed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @owned_seed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owned_seeds/1 or /owned_seeds/1.json
  def update
    respond_to do |format|
      if @owned_seed.update(owned_seed_params)
        format.html { redirect_to @owned_seed, notice: "Owned seeds was successfully updated." }
        format.json { render :show, status: :ok, location: @owned_seed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @owned_seed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owned_seeds/1 or /owned_seeds/1.json
  def destroy
    @owned_seed.destroy
    respond_to do |format|
      format.html { redirect_to owned_seeds_index_url, notice: "Owned seeds was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owned_seed
      @owned_seed = OwnedSeeds.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def owned_seed_params
      params.require(:owned_seed).permit(:user_profile_id, :flower_type_id, :quantity)
    end
end
