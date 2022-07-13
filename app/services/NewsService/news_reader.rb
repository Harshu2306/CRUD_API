module NewsService
  class NewsReader < ApplicationService
    def initialize(params)
      @params = params
    end

    def index
      if news = News.where(is_active: true).active_post.proper_date
        return true,news
      else
        return false,news
      end
    end

    def show
      news = News.find(@params[:id])
      news.increment!(:news_count)

      if news.like.present?
        news.like.increment!(:like_count)
      else
        news.like = Like.new(like_count: 1)
        news. like.save
      end
      return true,news
    end
  end
end