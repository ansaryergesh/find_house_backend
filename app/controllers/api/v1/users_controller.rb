# frozen_string_literal: true

# users controller
module Api::V1
  # users controller
  class UsersController < ApplicationController
    skip_before_action :authorized, only: %i[create]

    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user),
                       jwt: @token }, status: :created
      else
        render json: {message: @user.errors.full_messages}, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.permit(:username, :password, :bio, :avatar)
    end
  end
end
