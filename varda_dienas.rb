require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'date'

doc = open("http://www.vardadienas.lv/search/#{Time.now.day}.#{Time.now.month}") { |f| Hpricot(f) }

names = Array.new

doc.search("#search_results/div[@class='search_row search_row_date']/span[@class='result_name_date']/a").each do |name|
  names << name.inner_html
end

puts names.join(", ")