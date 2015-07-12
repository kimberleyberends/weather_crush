require 'yahoo_weatherman'

puts "location:"
location = gets.chomp
client = Weatherman::Client.new
weather = client.lookup_by_location(location)
current_temp = weather.condition['temp']
current_summary = weather.condition['text']
	
puts "#{location.capitalize} is currently #{current_temp} degrees. The weather outside is #{current_summary}."

weather.forecasts.each do |forecast|
	puts "Outlook for #{forecast['day']}: #{forecast['text']}. High of #{forecast['high']}c / Low of #{forecast['low']}c."

end