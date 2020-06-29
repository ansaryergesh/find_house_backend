class Api::V1::FavouritesController < ApplicationController

    def create
        @favoure = current_user.favourites.create!(favoure_params)
        favourites = Home.joins(:favourites).where(favourites: {user_id: current_user.id})
        render json: favourites, status: :ok
    end

    def favouriteValues
        render json: @isFavoure, status: :ok
    end

    def show
        render json: @isFavoure, status: :ok
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
        @favourList = current_user.favourites.find_by(home_id: params[:id])
        @favourList.destroy
        favourites = Home.joins(:favourites).where(favourites: {user_id: current_user.id})
        render json: favourites, status: :ok
    end

    private

    def favoure_params
        params.permit(:home_id)
    end

    def favoure?
        @isFavoure = Favourites.where(user_id: current_user.id, home_id: params[:id]).exists?
    end
end
