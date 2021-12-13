class OwnedFlowersController < ApplicationController
  before_action :set_owned_flower, only: %i[ show edit update destroy ]

  # GET /owned_flowers or /owned_flowers.json
  def index
    @owned_flowers = OwnedFlowers.all
  end

  # GET /owned_flowers/1 or /owned_flowers/1.json
  def show
  end

  # GET /owned_flowers/new
  def new
    @owned_flower = OwnedFlowers.new
  end

  # GET /owned_flowers/1/edit
  def edit
  end

  # POST /owned_flowers or /owned_flowers.json
  def create
    @owned_flower = OwnedFlowers.new(owned_flower_params)

    respond_to do |format|
      if @owned_flower.save
        format.html { redirect_to @owned_flower, notice: "Owned flowers was successfully created." }
        format.json { render :show, status: :created, location: @owned_flower }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @owned_flower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owned_flowers/1 or /owned_flowers/1.json
  def update
    respond_to do |format|
      if @owned_flower.update(owned_flower_params)
        format.html { redirect_to @owned_flower, notice: "Owned flowers was successfully updated." }
        format.json { render :show, status: :ok, location: @owned_flower }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @owned_flower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owned_flowers/1 or /owned_flowers/1.json
  def destroy
    @owned_flower.destroy
    respond_to do |format|
      format.html { redirect_to owned_flowers_index_url, notice: "Owned flowers was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owned_flower
      @owned_flower = OwnedFlowers.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def owned_flower_params
      params.require(:owned_flower).permit(:user_profile_id, :flower_type_id, :quantity)
    end
end
