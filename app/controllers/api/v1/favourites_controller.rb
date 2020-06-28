class Api::V1::FavouritesController < ApplicationController
    # before_action :set_home
    before_action :find_favour, only: [:destroy]

    def create
        @favoure = current_user.favourites.create!(favoure_params)
        favourites = Home.joins(:favourites).where(favourites: {user_id: current_user.id})
        render json: favourites, status: :ok
    end

    def favouriteValues
        @favourList = current_user.favourites.find_by(home_id: params[:id])
        render json: @favourList, status: :ok
    end

    def index
        if current_user
            favourites = Home.joins(:favourites).where(favourites: {user_id: current_user.id})
            render json: favourites, status: :ok
        else
            render json: { message: 'Please Login' }, status: :unauthorized
        end

    end

    def destroy
        @favourList.destroy
        favourites = Home.joins(:favourites).where(favourites: {user_id: current_user.id})
        render json: favourites, status: :ok
    end

    private

    def favoure_params
        # whitelist params
        params.permit(:home_id)
    end
    def set_home
        @home = Home.find(params[:home_id])
    end

    def find_favour
      @favoure= current_user.favourites.find(params[:id])
    end

    def favoure?
        Favourites.where(user_id: current_user.id, home_id: params[:home_id]).exists?
    end
end
