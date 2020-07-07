# frozen_string_literal: true

# Favourite Controller
module Api::V1
  # Favourite Controller
  class FavouritesController < ApplicationController
    def create
      if favoure?
        render json: {message: 'Already added'}, status: :unprocessable_entity
      else
        @favoure = current_user.favourites.create!(favoure_params)
        favourites = Home.joins(:favourites).where(favourites:
            { user_id: current_user.id })
        render json: favourites, status: :ok
      end
    end

    def show
      if favoure?
        render json: {status: false}, status: :ok
      else
        render json: {status: true}, status: :ok
      end
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
      @is_favoure = Favourite.where(user_id: current_user.id,
                                     home_id: params[:id]).exists?
    end
  end
end
