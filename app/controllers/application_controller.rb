class ApplicationController < ActionController::API
  include ApplicationHelper
  include JsonWebToken

  # before_action :authenticate_request

    def send_response(status, status_code, message, result, meta = {})
    render json: {
      status: status,
      message: message,
      data: result,
      meta: meta
    }, status: status_code
    end

   def prepare_meta(records, **args)
    meta= {
      pagination: {
        total_records: args[:total_record_count],
        current_page: args[:page_no],
        next_page: records.next_page.present? ? records.next_page : '',
        #previous_page: records.prev_page.present? ? records.prev_page : '',
        total_pages: records.total_pages,
        per_page: args[:per_page]
      }
    }
    return meta
   end
  private

  def authenticate_request

    if request.headers["Authorization"].present?
      header = request.headers["Authorization"]
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
      if @current_user.nil?
        send_response(0, 400, "You are not authorized user.", {})
      end
    else
      send_response(0, 400, "Authentication Token Not Found", {})
    end
  end
end
