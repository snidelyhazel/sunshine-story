class GameController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index

  end

  def home

    @user_profile = UserProfile.find(params[:id])
    inventory()
    get_plot()
    update_requests()

  end

  def shop

    @user_profile = UserProfile.find(params[:id])

    inventory()

  end

  def purchase

    @user_profile = UserProfile.find(params[:id])
    @flower_type = FlowerType.find(params[:flower_type_id_string])
    @quantity = params[:quantity_string].to_i
    total_price =  @flower_type.buy_price * @quantity

    if @quantity <= 0
      render json:
      {
        error: "quantity must be greater than zero :("
      }, status: :internal_server_error
    elsif @user_profile.sun_penny < total_price
      render json:
      {
        error: "not enough sunpennies to complete purchase :("
      }, status: :internal_server_error
    else
      existing_owned_seeds = OwnedSeeds.where("user_profile_id = ? AND flower_type_id = ?", @user_profile.id, @flower_type.id).first
      if existing_owned_seeds == nil
        OwnedSeeds.create!(user_profile_id: @user_profile.id, flower_type_id: @flower_type.id, quantity: @quantity)
      else
        existing_owned_seeds.update(quantity: existing_owned_seeds.quantity + @quantity);
      end
      @user_profile.update(sun_penny: @user_profile.sun_penny - total_price)
      redirect_to "/u/#{@user_profile.id}/shop"
    end

  end

  def inventory

    # Join the flower_types, owned_seeds and owned_flowers tables to query the name of the flowers and the current quantities owned.
    @owned_flower_types = FlowerType.find_by_sql(["SELECT flower_types.id AS flower_type_id, flower_types.name, flower_types.buy_price, flower_types.sell_price, COALESCE(owned_seeds.quantity, 0) AS seed_quantity, COALESCE(owned_flowers.quantity, 0) AS flower_quantity FROM flower_types LEFT OUTER JOIN owned_seeds ON owned_seeds.flower_type_id = flower_types.id AND owned_seeds.user_profile_id = ? LEFT OUTER JOIN owned_flowers ON owned_flowers.flower_type_id = flower_types.id AND owned_flowers.user_profile_id = ?", @user_profile.id, @user_profile.id])

  end

  def get_plot

    # Join the plot_slots and flower_types tables to query the name and metadata of the flowers, if any, for each plot slot in the grid.
    # Selects x, y, flower_type_id, when_planted, when_watered, name, growth_duration_seconds, max_water_interval, harvest_duration_seconds, and graphic.
    coordinate_list = []
    (0...@user_profile.plot_size).each do |y|
      (0...@user_profile.plot_size).each do |x|
        coordinate_list.push("(#{y},#{x})")
      end
    end
    coordinate_list_string = coordinate_list.join(', ')

    @all_plot_slots = PlotSlot.find_by_sql(["SELECT COALESCE(plot_slots.x, column2) AS x, COALESCE(plot_slots.y, column1) AS y, plot_slots.flower_type_id, plot_slots.when_planted, plot_slots.when_watered, flower_types.name, flower_types.id AS flower_type_id, flower_types.growth_duration_seconds, flower_types.max_water_interval, flower_types.harvest_duration_seconds, flower_types.graphic FROM (VALUES #{coordinate_list_string}) LEFT OUTER JOIN plot_slots ON plot_slots.x = column2 AND plot_slots.y = column1 AND plot_slots.user_profile_id = ? LEFT OUTER JOIN flower_types ON flower_types.id = plot_slots.flower_type_id",  @user_profile.id])

  end

  def expand

    @user_profile = UserProfile.find(params[:id])
    if @user_profile.sun_penny < 200
      render json:
      {
        error: "not enough sunpennies to complete purchase :("
      }, status: :internal_server_error
    else
      @user_profile.update(sun_penny: @user_profile.sun_penny - 200, plot_size: 4)
      redirect_to "/u/#{@user_profile.id}/"
    end

  end

  def update_requests
    total_owned_flowers = OwnedFlowers.where("user_profile_id = ?", @user_profile.id).sum(:quantity)
    if total_owned_flowers >= 27
      maximum_requests = 3
    elsif total_owned_flowers >= 9
      maximum_requests = 2
    elsif total_owned_flowers >= 3
      maximum_requests = 1
    else
      maximum_requests = 0
    end

    existing_request_count = CustomerRequest.where("user_profile_id = ?", @user_profile.id).length

    while existing_request_count < maximum_requests
      random_quantity = rand(5) + 1
      all_flower_types = FlowerType.all()
      random_flower_type = all_flower_types[rand(all_flower_types.length)]
      CustomerRequest.create!(user_profile_id: @user_profile.id, flower_type_id: random_flower_type.id, quantity: random_quantity)
      existing_request_count += 1
    end

    @all_customer_requests = CustomerRequest.find_by_sql(["SELECT customer_requests.id, customer_requests.quantity, flower_types.id AS flower_type_id, flower_types.name, customer_requests.quantity <= COALESCE(owned_flowers.quantity, 0) AS have_enough_flowers FROM customer_requests LEFT OUTER JOIN flower_types ON flower_types.id = customer_requests.flower_type_id LEFT OUTER JOIN owned_flowers ON owned_flowers.user_profile_id = customer_requests.user_profile_id AND owned_flowers.flower_type_id = customer_requests.flower_type_id WHERE customer_requests.user_profile_id = ?", @user_profile.id])

  end

  def plant

    @user_profile = UserProfile.find(params[:id])
    @flower_type = FlowerType.find(params[:flower_type_id])
    get_plot()

  end

  def plant_here
    @user_profile = UserProfile.find(params[:id])
    @flower_type = FlowerType.find(params[:flower_type_id])
    existing_plot_slot = PlotSlot.where("user_profile_id = ? AND x = ? AND y = ?", @user_profile.id, params[:plot_slot_x], params[:plot_slot_y]).first
    if existing_plot_slot != nil
      render json:
      {
        error: "something is already planted in this plot slot :("
      }, status: :internal_server_error
    else

      owned_seeds = OwnedSeeds.where("user_profile_id = ? AND flower_type_id = ?", @user_profile.id, @flower_type.id).first
      if owned_seeds == nil || owned_seeds.quantity <= 0
        render json:
        {
          error: "you don't have any seeds :("
        }, status: :internal_server_error
      else
        PlotSlot.create!(user_profile_id: @user_profile.id, flower_type_id: @flower_type.id, x: params[:plot_slot_x_string].to_i, y: params[:plot_slot_y_string].to_i, when_planted: DateTime.now, when_watered: DateTime.now)

        if owned_seeds.quantity > 1
          owned_seeds.update(quantity: owned_seeds.quantity - 1);
          redirect_to "/u/#{@user_profile.id}/plant/#{@flower_type.id}/"
        else
          owned_seeds.destroy()
          redirect_to "/u/#{@user_profile.id}/"
        end
      end
    end
  end

  def harvest_here
    @user_profile = UserProfile.find(params[:id])
    existing_plot_slot = PlotSlot.where("user_profile_id = ? AND x = ? AND y = ?", @user_profile.id, params[:plot_slot_x_string], params[:plot_slot_y_string]).first
    if existing_plot_slot == nil
      render json:
      {
        error: "there's nothing to harvest :("
      }, status: :internal_server_error
    else
      @flower_type = FlowerType.find(existing_plot_slot.flower_type_id)
      if DateTime.now.to_i - existing_plot_slot.when_planted.to_i <= @flower_type.growth_duration_seconds
        render json:
        {
          error: "this flower is not ready to harvest :("
        }, status: :internal_server_error
      else
        existing_plot_slot.destroy()
        existing_owned_flowers = OwnedFlowers.where("user_profile_id = ? AND flower_type_id = ?", @user_profile.id, @flower_type.id).first
        if existing_owned_flowers == nil
          OwnedFlowers.create!(user_profile_id: @user_profile.id, flower_type_id: @flower_type.id, quantity: 1)
        else
          existing_owned_flowers.update(quantity: existing_owned_flowers.quantity + 1);
        end
        redirect_to "/u/#{@user_profile.id}/"
      end
    end

  end

  def requests
    @user_profile = UserProfile.find(params[:id])
    inventory()
    update_requests()
  end

  def sell
    @user_profile = UserProfile.find(params[:id])
    existing_customer_request = CustomerRequest.find(params[:sell_customer_request_id_string])
    if existing_customer_request == nil
      render json:
      {
        error: "there's no customer request to fulfill :("
      }, status: :internal_server_error
    else
      existing_owned_flowers = OwnedFlowers.where("user_profile_id = ? AND flower_type_id = ?", @user_profile.id, existing_customer_request.flower_type_id).first
      if existing_owned_flowers == nil || existing_owned_flowers.quantity < existing_customer_request.quantity
        render json:
        {
          error: "you don't have enough flowers to fulfill the customer request :("
        }, status: :internal_server_error
      else
        @flower_type = FlowerType.find(existing_customer_request.flower_type_id)
        existing_owned_flowers.update(quantity: existing_owned_flowers.quantity - existing_customer_request.quantity)
        @user_profile.update(sun_penny: @user_profile.sun_penny + existing_customer_request.quantity * @flower_type.sell_price)
        existing_customer_request.destroy()
        redirect_to "/u/#{@user_profile.id}/requests"
      end
    end
  end
end
