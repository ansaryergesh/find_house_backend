class Api::V1::FavouritesController < ApplicationController
    before_action :set_home
    before_action :fint_favour, only: [:destroy]


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
