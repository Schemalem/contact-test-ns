require 'json'
require 'date'

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

# one age that we take from the interface, 65
# work out how old each talent are - date today - date of birth
# iterate through the array of hashes, if the talent matches that age


# age would figure out how old talent is
def age(day, month, year)
  age_in_days = (Date.today - Date.new(year, month, day)).to_i
  # age_in_years = age_in_days.to_f/365
  age_in_years = age_in_days/365
  return age_in_years
end

# puts age(17, 07, 1993)
#
def age_filter(age, filepath)
  talent_array = parse_json(filepath)
  talent_age_match = talent_array.select do |talent|
    dob_array = talent['date_of_birth'].split('-')
    year = dob_array[0].to_i
    month = dob_array[1].to_i
    day = dob_array[2].to_i
    talent_age = age(day, month, year)
    talent_age == age
  end
  return talent_age_match
end


puts age_filter(65, "data/example.json")
# age_range_filter would figure out if talent was within range
# def age
# def age_range(min, max, talent_array)
  # talent_within_age = talent_array.select do |talent|
  #     # age = age(talent['date_of_birth']) # works out age of talent
  #     # Check if the age is within range
  #     age >= min && age <= max ? true : false
  # end
# end
