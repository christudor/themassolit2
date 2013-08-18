desc "Get podcast titles"
task :get_podcast_titles => :environment do
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

xml = "iTunes Libary.xml"
doc = Nokogiri::HTML(open(xml))
set = doc.xpath('//key')

end
