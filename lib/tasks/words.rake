namespace :words do
  desc 'Load list of word from a file'
  task :load => :environment do
    Word.delete_all

    file_path = File.join(Rails.root, 'lib/resources/list.txt')
    words = File.readlines(file_path).map(&:chomp)

    words.map do |word|
      puts "Adding #{word} to the database"
      Word.create(name: word)
    end
  end
end
