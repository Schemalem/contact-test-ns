require 'json'

# Method that takes paramaters for chosen location and the parsed JSON file path
def filter_talent(location, filepath)
  # Parse json using parse_jason method
  talent_array = parse_json(filepath)
  # Array created by running location_filtered method
  filtered_talent = location_filter(talent_array, location)
  filtered_talent
end

# Read data from json file - selected in interface.rb
def parse_json(filepath)
  serialised_talent = File.read(filepath)
  talent_array = JSON.parse(serialised_talent)
  talent_array
end

# Method that iterates over data and filters by location
def location_filter(talent_array, location)
  talent_with_location = talent_array.select do |talent|
    # Remove any accidental whitespace with .strip
    # Check if the location is equal to springfield - casecmp takes into account case insensitivity
    talent['location'].strip.casecmp?(location)
  end
  # Return array of talent filtered by location
  talent_with_location
end

# Method to iterate over final talent list and generates just names for the interface
def name_drop(talent_list)
  talent_list.each do |talent|
    puts talent['name']
  end
end
