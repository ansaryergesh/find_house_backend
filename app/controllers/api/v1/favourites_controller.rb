class Api::V1::FavouritesController < ApplicationController
    # before_action :set_home
    before_action :fint_favour, only: [:destroy]

    def create
       @favoure = current_user.favourites.create!(favoure_params)
       render json: @favoure, status: :created
    end

    def index
        if current_user
            favourites = Home.joins(:favourites).where(favourites: {user_id: current_user.id})

            render json: favourites, status: :ok
        else
            render json: home, status: :unprocessable_entity
        end

    end

    def destroy
        @favour.destroy
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
        Favour.where(user_id: current_user.id, home_id: params[:home_id]).exists?
    end
end
