module UserService
  class UserCreator

    def initialize(params)
      @params=params
    end

    def create
      user = User.new(user_params)
      if user.save
        return user
      else
        return user
      end
    end

    def update
      user = User.find(user_params[:id])
      if user.update(user_params)
        return true,user      
      else
        return false,user
      end
    end

    def destroy
      User.destroy(user_params[:id])
    end

    private

    def user_params
      @params.permit(:id,:name,:username,:email,:phone,:password)
    end
  end
end