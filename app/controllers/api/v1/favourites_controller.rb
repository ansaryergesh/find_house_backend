class Api::V1::FavouritesController < ApplicationController
    before_action :set_home
    before_action :fint_favour, only: [:destroy]

    def create
        if favoure?
            destroy
        else
            @home.favourites.create(user_id: current_user.id)
            render json: @favour, status: :created
        end
    end
    def index
        @favourites = @favourites.favourited_by(params[:user_id]) if params[:user_id].present?
    end

    def destroy
        @favour.destroy
    end

    private

    def set_home
        @home = Home.find(params[:home_id])
    end

    def find_favour
        @favour= @home.favourites.find(params[:id])
    end

    def favoure?
        Favour.where(user_id: current_user.id, home_id: params[:home_id]).exists?
    end
end
