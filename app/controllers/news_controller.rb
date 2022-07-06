class NewsController < ApplicationController

  def index
    res,news = NewsService::NewsReader.new(params).index
    if res
      send_response(1, 200, "News listing", ActiveModelSerializers::SerializableResource.new(news))
    else
      end_response(0,404,"Something went wrong",news.errors)
    end
  end

  def create
    res,news = NewsService::NewsCreator.new(news_params).create
    if res
      send_response(1, 200, "News Created", ActiveModelSerializers::SerializableResource.new(news))
    else
      send_response(0,404,"Something went wrong",news.errors)
    end
  end

  def update
    res,news = NewsService::NewsCreator.new(params).update
    if res
      send_response(1, 200, "Updating News", ActiveModelSerializers::SerializableResource.new(news))
    else
      send_response(0,404,"Something went wrong",news.errors)
    end
  end

  def show
    res,news = NewsService::NewsReader.new(params).show
    if res
      send_response(1, 200, "News details", ActiveModelSerializers::SerializableResource.new(news))
    else
      send_response(0,404,"Something went wrong",news.errors)
    end
  end

  def destroy
    res,news = NewsService::NewsCreator.new().destroy
    if res
      send_response(1, 200, "Is_Delete is changed", ActiveModelSerializers::SerializableResource.new(news))
    else
      send_response(0,404,"Something went wrong", news.errors)
    end
  end

    private 
    def news_params
      params.permit(:title,:body,:published_date,:news_count,:image)
    end
end
