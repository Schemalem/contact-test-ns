require_relative "location_filter"

puts 'Welcome to our talent database'
puts 'Please enter the name of the location you wish to filter by'
puts '*****************************************************'

filepath = 'data/example.json'
location = gets.chomp
talent_list = filter_talent(location, filepath)

if talent_list.empty?
  puts "No talent found in #{location}"
else
  puts "We've found the following talent in #{location}:"
  talent_list.each do |talent|
    puts talent['name']
  end
end
