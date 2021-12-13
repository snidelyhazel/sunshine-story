class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: %i[ show edit update destroy ]

  # GET /user_profiles or /user_profiles.json
  def index
    @user_profiles = UserProfile.all
  end

  # GET /user_profiles/1 or /user_profiles/1.json
  def show
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit
  end

  # POST /user_profiles or /user_profiles.json
  def create
    @user_profile = UserProfile.new(user_profile_params)

    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to @user_profile, notice: "User profile was successfully created." }
        format.json { render :show, status: :created, location: @user_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1 or /user_profiles/1.json
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to @user_profile, notice: "User profile was successfully updated." }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1 or /user_profiles/1.json
  def destroy
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url, notice: "User profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Signup: new user_profile creation
  def signup

    @signup_name = params[:username_string]

    # Find existing user_profile match if exists.
    existing_profile = UserProfile.where("lower(user_name) = ?", @signup_name.downcase).first
    if existing_profile != nil
      render json:
      {
        error: "user_profile already exists"
      }, status: :internal_server_error
    else

      # Crease new user_profile with provided username entry.
      new_profile = UserProfile.create!(user_name: @signup_name, sun_penny: 100, last_update: Time.now, plot_size: 3)
      redirect_to "/u/#{new_profile.id}/"

    end

  end

  # Login: existing user_profile match
  def login

    @login_name = params[:username_string]

    # Find existing user_profile match if exists.
    existing_profile = UserProfile.where("lower(user_name) = ?", @login_name.downcase).first
    if existing_profile == nil
      render json:
      {
        error: "user_profile does not exist"
      }, status: :internal_server_error
    else

      # Load dashboard associated with user_profile for username match.
      redirect_to "/u/#{existing_profile.id}/"
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_profile_params
      params.require(:user_profile).permit(:user_name, :sun_penny, :last_update)
    end
end
