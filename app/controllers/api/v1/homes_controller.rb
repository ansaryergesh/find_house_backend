class Api::V1::HomesController < ApplicationController
     before_action :set_home, only: [:show, :update, :destroy]
     
     skip_before_action :authorized, only: %i[index]
      # GET /todos
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
      # POST /homes
      def create
        @home = current_user.homes.create!(home_params)
        if @home.save
            render json: @home, status: :created
        else
            render json: {message: 'Something went wrong'}, status: :unprocessable_entity
        end

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
        @myHouse.destroy
        head :no_content
      end
    
      private
    
      def home_params
        # whitelist params
        params.permit(:name, :descripton, :price)
      end
    
      def set_home
        @home = Home.find(params[:id])
      end

end
