#!/usr/bin/ruby

#
# Author: almartin <alex.m.martineau@gmail.com>
# Language: Ruby
# Descrption: Example script implementing Haversine formula for use in geolocation
#

earthRadius = 6371 # Earth's radiusin KM


# hardcoded example coordinates #
lat1 = 41.5592880250001
lat2 = 41.8574079970001
lon1 = -73.0371704099999
lon2 = -72.00779572399991
#################################

    def convDegRad(value)
      unless value.nil? or value == 0
            value = (value/180) * Math::PI
      end
    return value
    end

    deltaLat = (lat2-lat1) # Lat prior to conversion to radian
    deltaLon = (lon2-lon1) # lon prior to conversion to radian
    deltaLat = convDegRad(deltaLat)
    deltaLon = convDegRad(deltaLon)

    # Calculate square of half the chord length between latitude and longitude
    a = Math.sin(deltaLat/2) * Math.sin(deltaLat/2) +
        Math.cos((lat1/180 * Math::PI)) * Math.cos((lat2/180 * Math::PI)) * 
        Math.sin(deltaLon/2) * Math.sin(deltaLon/2); 

    # Calculate the angular distance in radians
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

    distance = earthRadius * c
    puts distance
