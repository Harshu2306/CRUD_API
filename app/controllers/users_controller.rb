class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  #before_action :set_user, only: [:show]

  #GET /users
  def index
    user = UserService::UserReader.new(user_params).index
    send_response(1,200,"All User are Listed Below",ActiveModelSerializers::SerializableResource.new(user))
  end

  #GET /users/{user_name}
  def show
    user = UserService::UserReader.new(user_params).show
    send_response(1,200,"Details of your User is as Below",ActiveModelSerializers::SerializableResource.new(user))
  end

  #POST /users

  def create
    user = UserService::UserCreator.new(user_params).create
    if user
      send_response(1,200,"User is Created",ActiveModelSerializers::SerializableResource.new(user))
    else
      send_response(1,200,"User is Created",user.errors)
    end
  end

  #PUT /users/{username}
  def update
    res,user = UserService::UserCreator.new(user_params).update
    if res
      send_response(1, 200, "This is Updated User", ActiveModelSerializers::SerializableResource.new(user))
    else
      send_response(0,404,"Something went wrong",user.errors)
    end

  end

  # DELETE/users/{username}
  def destroy
    user = UserService::UserCreator.new(user_params).destroy
    send_response(0,404,"User is Deleted",{})
  end

  private

    def user_params
      params.permit(:id,:name,:username,:email,:phone,:password)
    end
end
