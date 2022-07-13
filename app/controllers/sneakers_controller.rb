class SneakersController < ApplicationController

  def index
    sneaker = @current_user.sneakers
    send_response(0,200,"Listing of your sneakers",ActiveModelSerializers::SerializableResource.new(sneaker))
  end

  def create
    sneaker = @current_user.sneakers.new(sneaker_params)
    if sneaker.save
      send_response(0,200,"Sneaker is created successfully",ActiveModelSerializers::SerializableResource.new(sneaker))
    else
      send_response(1,404,"Something went wrong",sneaker.errors)
    end
  end

  def update
      sneaker = @current_user.sneakers.find_by(id: params[:id])
      if sneaker.present?
        if sneaker.update(sneaker_params)
          send_response(0,200,"Sneaker is updated successfully",ActiveModelSerializers::SerializableResource.new(sneaker))
        else
          send_response(1,404,"Something went wrong",{})
        end
      else
        send_response(1,404,"Something went wrong",{})
      end
  end

  def show
    sneakers = @current_user.sneakers.find(params[:id])
    if @current_user.sneakers
      send_response(0,200,"Details of your sneakers",ActiveModelSerializers::SerializableResource.new(sneakers))
    else
      send_response(1,404,"Something went wrong",sneakers.errors)
    end

  end


  def destroy
    sneaker = @current_user.sneakers.find_by(id: params[:id])
    if sneaker.present?
      sneaker.destroy(params[:id])
      send_response(0,200,"Your sneaker is deleted successfully",ActiveModelSerializers::SerializableResource.new(sneaker))
    else
      send_response(1,404,"Record not found",{})
    end
  end

    private

    def sneaker_params
      params.permit(:sneaker_name,:company,:price,:size)
    end
end
