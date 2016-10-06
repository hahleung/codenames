namespace :words do
  desc 'Load list of word from a file'
  task :load => :environment do
    Word.delete_all

    file_path = File.join(Rails.root, 'lib/resources/list.txt')
    file_path_fr = File.join(Rails.root, 'lib/resources/list_fr.txt')
    words = File.readlines(file_path).map(&:chomp)
    words_fr = File.readlines(file_path_fr).map(&:chomp).map(&:capitalize)

    words.zip(words_fr).map do |word, word_fr|
      puts "Adding #{word} to the database"

      Word.create(
        name: word,
        french_translation: word_fr
      )
    end
  end
end
