class NewsController < ApplicationController
   def index
    news = News.all
    news = news.paginate(page: params[:page], per_page: 3)
    page_no = params[:page].present? ? params[:page] : DEFAULT_PAGE
    per_page = params[:per_page].present? ? params[:per_page] : PER_PAGE_RECORDS
    meta = prepare_meta(news, total_record_count: news.count, page_no: page_no, per_page: per_page)
    send_response(0, 200, "News Listing", ActiveModelSerializers::SerializableResource.new(news),meta)
    end

    def create
      news = News.new(news_params)
      if news.save
        send_response(0, 200, "news is created", ActiveModelSerializers::SerializableResource.new(news))
      else
        send_response(1, 404, "Something went wrong",news.errors)
      end
    end

    def update
      news = News.find(news_params[:id])
      if news.update(news_params)
        send_response(0, 200, "news is updated", ActiveModelSerializers::SerializableResource.new(news))
      else
        send_response(1, 404, "Something went wrong", news.errors)
      end
    end

    def show
      news = News.find(params[:id])
      send_response(1, 200, "Your news is : ", ActiveModelSerializers::SerializableResource.new(news))
    end

    def destroy
      news = News.find(params[:id])
      if news.present?
      news.destroy 
      send_response(0, 200, "news is deleted",{})
      else
        send_response(1, 404, "news does not exists",{})
      end
    end


    def add_like
      news = News.find_by(id: params[:id])
      news.increment!(:like_count)
      send_response(0, 200, "Like_Count is incrementend By 1", ActiveModelSerializers::SerializableResource.new(news))
    end

    private

    def news_params
      params.permit(:id, :news_title, :news_body, :published_date, :like_count)
    end
end
