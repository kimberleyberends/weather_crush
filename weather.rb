#display current weather by location
require 'yahoo_weatherman'

puts "location:"
location = gets.chomp
client = Weatherman::Client.new

current_temp = client.lookup_by_location(location).condition['temp']
current_summary = client.lookup_by_location(location).condition['text']

puts "#{location.capitalize} is currently #{current_temp} degrees. The weather outside is #{current_summary}"
