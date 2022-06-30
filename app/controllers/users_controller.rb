class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :destroy]

  #GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  #GET /users/{user_name}
  def show
    render json: @user, status: :ok
  end

  #POST /users

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  #PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  # DELETE/users/{username}
  def destroy
    @user.destroy
  end

  private

    def user_params
      params.permit(:name,:username,:email,:phone,:password)
    end

    def set_users
      @user = User.find(params[:id])
    end

    def test
    end

end
