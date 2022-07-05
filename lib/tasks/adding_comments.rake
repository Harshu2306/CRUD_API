namespace :custom_task do
  desc "add testing comment in every blog"
  task adding_comments: :environment do
    h = Blog.all
    h.each do |b|
      b.comments.create(
        comment_title: "From rake task",
        comment_text:  "from rake task"
        )
    end
     
  end
end