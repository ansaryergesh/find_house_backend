# frozen_string_literal: true

# Home Controller
module Api::V1
  # Home Controller
  class HomesController < ApplicationController
    before_action :set_home, only: %i[show update destroy]
    skip_before_action :authorized, only: %i[index]

    def index
      @homes = Home.all
      render json: @homes
    end

    def userhouse
      @my_house = current_user.homes
      render json: @my_house, status: :ok
    end

    def edit
      @home = Home.find(params[:id])
    end

    def create
      @home = current_user.homes.create!(home_params)
      if @home.valid?
        renderlist = Home.all
        render json: renderlist, status: :ok
      else
        render json: { message: @home.errors.full_messages }, status: :unprocessable_entity
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
      @my_house.destroy
      head :no_content
    end

    private

    def home_params
      params.permit(:name, :descripton, :price)
    end

    def set_home
      @home = Home.find(params[:id])
    end
  end
end
