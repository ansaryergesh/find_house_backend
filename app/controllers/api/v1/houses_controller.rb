class Api::V1::HousesController < ApplicationController
    before_action :set_house, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @houses = House.all
    json_response(@houses)
  end

  # POST /houses
  def create
    @house = current_user.houses.create!(house_params)
    json_response(@house, :created)
  end

  # GET /houses/:id
  def show
    json_response(@house)
  end

  # PUT /houses/:id
  def update
    @house.update(house_params)
    head :no_content
  end

  # DELETE /houses/:id
  def destroy
    @house.destroy
    head :no_content
  end

  private

  def house_params
    # whitelist params
    params.permit(:name, :description, :price)
  end

  def set_house
    @house = House.find(params[:id])
  end
end
