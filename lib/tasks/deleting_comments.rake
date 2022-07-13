namespace :custom_task12 do
  desc "deleting comments"
  task deleting_comments: :environment do

   c=Comment.all
   if c.Blog.nil?
    c.delete
   end
  end   
end