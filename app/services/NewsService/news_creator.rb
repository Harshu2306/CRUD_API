module NewsService
  class NewsCreator < ApplicationService
    def initialize(params)
      @params = params
    end

    def create
      news = News.new(news_params)
      news.image.attach(news_params[:image])
      if news.save
        return true,news
      else
        return false,news
      end
    end

    def update
      news = News.find(@params[:id])
      if news.update(news_params)
        return true,news
      else
        return false,news    
      end
    end

    def destroy
      news = News.find(@params[:id])
      news.update(is_delete: true)

      if news.is_delete == true
        return true,news
      else
        return false,news
      end
    end

      private
      def news_params
        @params.permit(:title,:body,:published_date,:news_count,:image)
      end
  end
end