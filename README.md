# Contact Technical Test - Nicole Schembri
Contact's take home test, completed in Ruby for an Associate Developer role.
The purpose of this project is to display data pulled from a JSON file and allow users to search for talent based on a location.

## To get started

```
# clone the project to your machine 
# then run the below command in your terminal

> bundle install
```

## Running this program
The file comes pre-loaded with an example JSON file, found within the data folder titled 'example.json'. If you wish to run this interface with a different JSON file, be sure to redirect the filepath variable on line 7 of the lib/interface.rb file.

Running this program will produce the names of talent that match the location you input. Location information is case insensitive, and also ignores any leading/trailing whitespace

```
# run the following line in your terminal

> ruby lib/interface.rb
# this will allow you to input your choosen location. The following locations are available in the example file for you to try: Springfield, Los Angeles and Philidelphia
```

## Testing
Some RSpec tests have been implemented using the example.json file. This checks many things including:
- That the final talent list includes all of the original information about the talent, so it can be accessed if needed
- That the final talent list only includes talent from the specified location
- That the final talent list matches the expected talent from the example file

```
# run the tests using the following line in terminal

> rspec spec/location_filter_spec.rb
# all tests should pass using the example.json data file
```

If you have any questions about this application, please get in touch! nschembri93@gmail.com
