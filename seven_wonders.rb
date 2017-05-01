require 'httparty'

class SevenWonders

  def self.getSevenWondersData
    seven_wonders = ["Great Pyramind of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Lighthouse of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]
    final_result = {}

    #loop through my seven wonders
    seven_wonders.each do |name|
      #concatinate google api adress to include my seven wonders
      response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{name}")

      data = JSON.parse(response.body)
      #data sample below
      final_result[name] = data['results'][0]['geometry']['location']
    end

    return final_result
  end

end

puts SevenWonders.getSevenWondersData

#data sample result from google api
# {
#    "results" : [
#       {
#          "address_components" : [
#             {
#                "long_name" : "Al Haram",
#                "short_name" : "Al Haram",
#                "types" : [ "route" ]
#             },
#             {
#                "long_name" : "Nazlet El-Semman",
#                "short_name" : "Nazlet El-Semman",
#                "types" : [ "administrative_area_level_3", "political" ]
#             },
#             {
#                "long_name" : "Al Haram",
#                "short_name" : "Al Haram",
#                "types" : [ "administrative_area_level_2", "political" ]
#             },
#             {
#                "long_name" : "Giza Governorate",
#                "short_name" : "Giza Governorate",
#                "types" : [ "administrative_area_level_1", "political" ]
#             },
#             {
#                "long_name" : "Egypt",
#                "short_name" : "EG",
#                "types" : [ "country", "political" ]
#             }
#          ],
#          "formatted_address" : "Al Haram, Nazlet El-Semman, Al Haram, Giza Governorate, Egypt",
#          "geometry" : {
#             "location" : {
#                "lat" : 29.9792345,
#                "lng" : 31.1342019
#             },
#             "location_type" : "APPROXIMATE",
#             "viewport" : {
#                "northeast" : {
#                   "lat" : 29.9805834802915,
#                   "lng" : 31.1355508802915
#                },
#                "southwest" : {
#                   "lat" : 29.9778855197085,
#                   "lng" : 31.1328529197085
#                }
#             }
#          },
#          "place_id" : "ChIJGymPrIdFWBQRJCSloj8vDIE",
#          "types" : [ "establishment", "point_of_interest", "premise" ]
#       }
#    ],
#    "status" : "OK"
# }










#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Lighthouse of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}
