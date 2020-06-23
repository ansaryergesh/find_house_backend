class Api::V1::HomesController < ApplicationController
 
     before_action :set_home, only: [:show, :update, :destroy]
     skip_before_action :authorized, only: %i[index]
      # GET /todos
      def index
        @homes = Home.all
        render json: @homes
      end

      # POST /homes
      def create
        @home = current_user.homes.create!(home_params)
        json_response(@home, :created)
      end
    
      # GET /homes/:id
      def show
        json_response(@home)
      end
    
      # PUT /homes/:id
      def update
        @home.update(home_params)
        head :no_content
      end
    
      # DELETE /homes/:id
      def destroy
        @home.destroy
        head :no_content
      end
    
      private
    
      def home_params
        # whitelist params
        params.permit(:name, :description, :price)
      end
    
      def set_home
        @home = Home.find(params[:id])
      end
 
    
end
