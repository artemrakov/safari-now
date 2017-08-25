require 'nokogiri'
require 'open-uri'

def get_descriptions
  url = "https://www.bookallsafaris.com"
  html = open(url).read
  noko = Nokogiri::HTML(html)
  links = noko.css('.caption-section').css('a')

  shows = links.map do |noko_link|
    url + noko_link.attributes["href"].value
  end

  descriptions = shows.map do |lol|
    parse = Nokogiri::HTML(open(lol))
    paras =  parse.css('p')
    long_paras =  paras.select do |para|
      para.text.length > 300
    end
    long_paras.first.text
  end

  return descriptions
end
