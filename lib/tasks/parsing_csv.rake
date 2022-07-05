namespace :parse_csv do
  require 'csv'
  desc "parsing csv file to print all data of it"
  task parsing_csv: :environment do

    csv_text = File.read('public/demo_filetest.csv')
    csv = CSV.parse(csv_text, headers: true)
    (0..(csv.count - 1)).each do |index|
      puts csv[index]['blog_title']
      puts csv[index]['body']
    end
  end

end
