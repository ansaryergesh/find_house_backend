# frozen_string_literal: true

# Favourite Controller
module Api::V1
  # Favourite Controller
  class FavouritesController < ApplicationController
    def create
      @favoure = current_user.favourites.create!(favoure_params)
      favourites = Home.joins(:favourites).where(favourites:
          { user_id: current_user.id })
      render json: favourites, status: :ok
    end

    def favouritevalues
      render json: @is_favoure, status: :ok
    end

    def show
      render json: @is_favoure, status: :ok
    end

    def index
      if current_user
        favourites = Home.joins(:favourites).where(favourites:
            { user_id: current_user.id })
        render json: favourites, status: :ok
      else
        render json: { message: 'Please Login' }, status: :unauthorized
      end
    end

    def destroy
      @favourlist = current_user.favourites.find_by(home_id: params[:id])
      @favourlist.destroy
      favourites = Home.joins(:favourites).where(favourites:
          { user_id: current_user.id })
      render json: favourites, status: :ok
    end

    private

    def favoure_params
      params.permit(:home_id)
    end

    def favoure?
      @is_favoure = Favourites.where(user_id: current_user.id,
                                     home_id: params[:id]).exists?
    end
  end
end
