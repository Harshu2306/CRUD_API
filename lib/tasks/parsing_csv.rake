namespace :parse_csv do
  require 'csv'
  desc "Inserting csv data into rails database."
  task parsing_csv: :environment do

    csv_text = File.read('public/demo_filetest.csv')
    csv = CSV.parse(csv_text, headers: true)
    (0..(csv.count - 1)).each do |index|
       
      blogs = Blog.create({

        title: csv[index]['blog_title'],
        body: csv[index]['body'],
        published_date: csv[index]['publish_date']
      })

      blogs.comments.create({

        comment_title: csv[index]['comment_title'],
        comment_text: csv[index]['comment_text']
      })
    end
  end

end
