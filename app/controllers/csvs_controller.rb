class CsvsController < ApplicationController
  def generate_csv
    require 'csv'

    file = "#{Rails.root}/public/blog_data.csv"

    comments = Comment.where(is_delete: false)

    headers = ["Blog ID", "Title", "Body", "Comment_id", "comment_title", "comment_text"]

    CSV.open(file, 'w', write_headers: true, headers: headers) do |b|
      comments.each do |c|
        b << [c.blog.id, c.blog.title, c.blog.body, c.id, c.comment_title, c.comment_text]
        # send_response(0,200,"Csv is generatd in Public folder.",{})
        # return
        # puts c.id
        # puts c.blog.id
      end
    end
  
  end

  # def generate_csv
  # require 'csv'
  #   file = "#{Rails.root}/public/blog_data.csv"
  #    CSV.generate(headers: true) do |csv|
  #     csv << Comment.column_name

  #     all.each do |comment|
  #       csv << attributes.map{ |attr| comment.send(attr) }
  #     end
  #   end
  # end

end
