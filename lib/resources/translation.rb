class Translator
  def self.from_english(word)
    path = 'http://www.linguee.com/english-french/search?source=auto&query=' + word

    doc = Nokogiri::HTML(open(path))

    search = doc.css('a').select{ |link| link['class'] == "dictLink featured" }.first

    translation = search.nil? ? word : search.children.first.to_s.capitalize.strip

    Iconv.iconv('utf-8', 'iso8859-1', translation).first
  end
end
