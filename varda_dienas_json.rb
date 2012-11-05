require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'date'
require 'json'

names = Hash.new
month_days = Hash.new

month = 1

(Date.new(2012, 1, 1)..Date.new(2012, 12, 31)).select{ |date|
  
  print "Process #{date.day}.#{date.month}\n"
  
  if month != date.month
    month = date.month
    names[(month-1).to_s] = month_days
    
    month_days = Hash.new
  end
  
  doc = open("http://www.vardadienas.lv/search/#{date.day}.#{date.month}") { |f| Hpricot(f) }
  
  n = Array.new
  
  doc.search("#search_results/div[@class='search_row search_row_date']/span[@class='result_name_date']/a").each do |name|
    n << name.inner_html
  end
  
  month_days[date.day.to_s] = n
  
}
  
names[month.to_s] = month_days

File.open('/Users/kristaps/Documents/random_scripts/varda_dienas/json.txt', 'w') {|f| f.write(names.to_json) }