#!/bin/bash

# Weather data fetcher for waybar
# This script fetches weather data from openweathermap.com

api_key=6302ba3e4842c310a7c75a4514e07266
lat=22.2855
lon=114.1577

# Create cache directory if it doesn't exist
mkdir -p ~/.cache

url="api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${api_key}&cnt=5&units=metric&lang=en"

# Fetch weather data
curl ${url} -s -o ~/.cache/weather.json

# Display weather information
if [[ -f ~/.cache/weather.json ]]; then
    TEMP=$(cat ~/.cache/weather.json | jq '.main.temp' | awk '{print int($1+0.5)}')
    CONDITION=$(cat ~/.cache/weather.json | jq -r '.weather[0].main')
    CITY=$(cat ~/.cache/weather.json | jq -r '.name')
    
    # Get weather icon based on icon code
    ICON_CODE=$(cat ~/.cache/weather.json | jq -r '.weather[0].icon')
    case $ICON_CODE in
        01d) ICON="☀️" ;;
        01n) ICON="🌙" ;;
        02d|02n) ICON="⛅" ;;
        03d|03n|04d|04n) ICON="☁️" ;;
        09d|09n|10d|10n) ICON="🌧️" ;;
        11d|11n) ICON="⛈️" ;;
        13d|13n) ICON="❄️" ;;
        50d|50n) ICON="🌫️" ;;
        *) ICON="🌡️" ;;
    esac
    
    echo "${ICON} ${TEMP}°C ${CONDITION}"
else
    echo "Weather data unavailable"
fi
