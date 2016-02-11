module V1
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    # GET /users
    def index
      @users = User.all

      respond_with_json @users
    end

    # GET /users/1
    def show
      respond_with_json @user
    end

    # POST /users
    def create
      @user = User.new(user_params)
      @user.save
      respond_with_json @user, status: :created, location: @user
    end

    # PATCH/PUT /users/1
    def update
      @user.update(user_params)
      respond_with_json @user
    end

    # DELETE /users/1
    def destroy
      @user.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:email, :name, :password, :role)
      end
  end
end
