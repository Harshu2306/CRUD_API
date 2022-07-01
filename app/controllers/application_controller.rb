class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request

    def send_response(status, status_code, message, result, meta = {})
    render json: {
      status: status,
      message: message,
      data: result,
      meta: meta
    }, status: status_code
    end
  private

  def authenticate_request

    if request.headers["Authorization"].present?
      header = request.headers["Authorization"]
      header = header.split(" ").last if header
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    else
      send_response(0, 400, "Authentication Token Not Found", {})
    end
  end
end
