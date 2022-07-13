namespace :my_namespace do
  require 'csv'
  desc "Exporting data in csv"
  task my_task1: :environment do

    require 'csv'

    file = "#{Rails.root}/public/blog_data.csv"

    comments = Comment.where(is_delete: false)

    headers = ["Blog ID", "Title", "Body", "Comment_id", "comment_title", "comment_text"]

    CSV.open(file, 'w', write_headers: true, headers: headers) do |b|
      comments.each do |c|
        b << [c.blog.id, c.blog.title, c.blog.body, c.id, c.comment_title, c.comment_text]
      end
    end
  end
end
