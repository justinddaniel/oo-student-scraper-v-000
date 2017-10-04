require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url = "http://67.205.182.198:48121/fixtures/student-site/")
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    snames = doc.css("h4.student-name")
    namesarray = []
    snames.each do |a|
      namesarray << a.text
    end
    slocation = doc.css("p.student-location")
    locationsarray = []
    slocation.each do |l|
      locationsarray << l.text
    end
    ssites = doc.css(".student-card a")
    sitesarray = []
    ssites.each do |s|
      sitesarray << s.attributes.first[1].value
    end
    x = sitesarray.length
    sarray = Array.new(x, " ")
    i = 0
    binding.pry
    
    #sarray.each do |hash|
      #hash = Hash.new
      #hash[:name] = namesarray[i]
      #hash[:location] = locationsarray[i]
      #hash[:profile_url] = sitesarray[i]
      #i += 1
    end

    sarray
  end

  def self.scrape_profile_page(profile_url)

  end

end
