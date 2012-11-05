require 'rubygems'
require 'date'
require 'json'

begin
  names_days = JSON.parse(File.read('json.txt'))

  if ARGV[0]
    names =  names_days[ARGV[0].split(".")[1].to_s][ARGV[0].split(".")[0].to_s]
  else
    names =  names_days[Time.now.month.to_s][Time.now.day.to_s]
  end

  puts names.join(", ")
rescue Exception => e  
  puts e.message  
  puts e.backtrace.inspect
  puts "Can't find a names for date: " + (ARGV[0] ? ARGV[0] : "#{Time.now.day}.#{Time.now.month}")
end