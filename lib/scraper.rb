require "open-uri"
require "nokogiri"
# Lines 4 - 11 show textbook example for scraping results from Etsy website.

#   html_content = URI.open('https://www.etsy.com/search?q=wallet').read
#   doc = Nokogiri::HTML(html_content)

#   doc.search('.wt-grid .v2-listing-card__info .text-body').each_with_index do |element, index|
#     puts "#{index + 1}. #{element.text.strip}"
# end

def scrape_craiglist_antiques(city)
  # TODO: return an array of Antiques found of Craigslist for this `city`.
  antiques_found = Array.new

  city = URI.open("https://#{city}.craigslist.org/d/for-sale/search/sss?query=antiques&sort=rel")
  doc = Nokogiri::HTML(city)

  antiques_found << doc.search('.result-info .result-title').each do |element|
    puts "#{element.text.strip}"
  end

end

puts scrape_craiglist_antiques("saopaulo")
