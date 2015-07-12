#provides five-day weather forecast by location.
#user input via terminal.

require 'yahoo_weatherman'

puts "location:"
location = gets.chomp

client = Weatherman::Client.new
weather = client.lookup_by_location(location)
today = Time.now.strftime('%w').to_i

puts "-- WEATHER OUTLOOK FOR #{location.upcase} --"

weather.forecasts.each do |forecast|
	date = forecast['date']
	weekday = date.strftime('%w').to_i
	#next four lines return 'Today' and 'Tomorrow' for corresponding days.
	if weekday == today
		dayTag = 'Today'
	elsif weekday == today + 1
		dayTag = 'Tomorrow'
	else dayTag = date.strftime('%A') #returns full weekday name
end

puts "#{dayTag}: #{forecast['text']}. High of #{forecast['high']} / Low of #{forecast['low']}."
end