require 'uri'
require 'net/http'
require "json"


class Package
    attr_accessor :weight, :length, :width, :height,:from,:to,:distance,:price
    def initialize(weight, length, width, height,from,to)
        @weight = weight;       
        @length = length;  
        @width = width;
        @height = height;
        @from = from;
        @to = to;
        @distance = calculateDisnance();
        @price = calculatePrice();
    end
    def hash
        hash={
            weight:@weight,
            lenght:@lenght,
            width:@width,
            from:@from,
            to:@to,
            distance:@distance,
            price:@price
        }
    end
    def calculateDisnance
        fromCoords = getCoords(@from);
        toCoords = getCoords(@to);
        uri = URI(format("https://api.mapbox.com/directions/v5/mapbox/driving/%<from_longitude>s,%<from_latitude>s;%<to_longitude>s,%<to_latitude>s?access_token=%<token>s", 
            {
                from_longitude: fromCoords[0], 
                from_latitude: fromCoords[1], 
                to_longitude: toCoords[0], 
                to_latitude: toCoords[1], 
                token: 'pk.eyJ1Ijoidmxzdm0iLCJhIjoiY2t3ejUwb21jMGR5NTJ0cHpwcjE5NTBkOCJ9.6gKaYFb56EGJK9VUUpJnTw'
            }
        ))
        res = Net::HTTP.get_response(uri)
        if res.is_a?(Net::HTTPSuccess)
            return JSON.parse(res.body)["routes"][0]["distance"]/1000
        end
    end
    def getCoords(placeName)
        uri = URI(format("https://api.mapbox.com/geocoding/v5/mapbox.places/%<address>s.json?access_token=%<token>s", 
            {
                address: placeName, 
                token: 'pk.eyJ1Ijoidmxzdm0iLCJhIjoiY2t3ejUwb21jMGR5NTJ0cHpwcjE5NTBkOCJ9.6gKaYFb56EGJK9VUUpJnTw'
            }
        ))
        res = Net::HTTP.get_response(uri)
        if res.is_a?(Net::HTTPSuccess)
            return JSON.parse(res.body)["features"][0]["center"]
        end
    end
    def calculatePrice()
        return distance unless length.to_f * width.to_f * height.to_f > 1
        return distance.to_f * 2 unless weight.to_f > 10
        return distance.to_f * 3
    end
end