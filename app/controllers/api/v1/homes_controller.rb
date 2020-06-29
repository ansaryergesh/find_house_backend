# frozen_string_literal: true

class Api::V1::HomesController < ApplicationController
  before_action :set_home, only: %i[show update destroy]

  skip_before_action :authorized, only: %i[index]

  def index
    @homes = Home.all
    render json: @homes
  end

  def userHouse
    @myHouse = current_user.homes
    render json: @myHouse
  end

  def edit
    @home = Home.find(params[:id])
  end

  def create
    @home = current_user.homes.create!(home_params)
    if @home.save
      render json: @home, status: :created
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  def show
    render json: @home
  end

  def update
    @home.update(home_params)
    head :no_content
  end

  def destroy
    @myHouse.destroy
    head :no_content
  end

  private

  def home_params
    params.permit(:name, :descripton, :price, user_id: current_user.id)
  end

  def set_home
    @home = Home.find(params[:id])
  end
end
