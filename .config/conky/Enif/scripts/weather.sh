#!/bin/bash

# This script is to get weather data from openweathermap.com in the form of a json file
# so that conky will still display the weather when offline even though it doesn't up to date

# you can use this or replace with yours
api_key=6302ba3e4842c310a7c75a4514e07266

# get your city id at https://openweathermap.org/find and replace
#city=Hong Kong
#city_id=1819729
lat=22.2855
lon=114.1577

url="api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${api_key}&cnt=5&units=metric&lang=en"
curl ${url} -s -o ~/.cache/weather.json

exit