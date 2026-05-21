#!/bin/bash

# Greeting script - displays time-based greeting
Greeting=$(date +%H)
case $Greeting in
    00|01|02) echo "Good Midnight" ;;
    03|04|05|06|07|08|09|10) echo "Good Morning" ;;
    11|12) echo "Good Day" ;;
    13|14|15|16|17) echo "Good Afternoon" ;;
    18|19|20|21) echo "Good Evening" ;;
    22|23) echo "Good Night" ;;
    *) echo "Hello" ;;
esac
