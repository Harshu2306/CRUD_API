module UserService
  class UserReader < ApplicationService
    def initialize(params)
      @params = params
    end

    def index
      user = User.all
    end

    def show
      user = User.find(user_params[:id])
      return user
    end

    private
    def user_params
      @params.permit(:id,:name,:username,:email,:phone,:password)
    end
  end
end