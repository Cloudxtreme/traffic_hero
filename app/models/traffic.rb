class Traffic < ActiveRecord::Base
  # require 'httparty'
  belongs_to :user

  def self.route_details(origin, destination)
     logger.debug("origin: #{origin}")
     logger.debug("destination: #{destination}")

     origin = URI.encode(origin)
     destination = URI.encode(destination)
     url = "http://dev.virtualearth.net/REST/V1/Routes?wp.0=#{origin}&wp.1=#{destination}&optmz=timeWithTraffic&key=AsSCfxqr3ZwDpzKWEY4VgAoinIugwTeGNm-dmaG9X718G1NQQlPlTfOV30AWYUCd"
  
     logger.debug("HTTParty.get url = " + url);

     response = HTTParty.get url

     logger.debug("response: #{response}")
  
     traffic_congestion = response["resourceSets"][0]["resources"][0]["trafficCongestion"]
     travel_distance    = response["resourceSets"][0]["resources"][0]["travelDistance"]
     traffic_time       = response["resourceSets"][0]["resources"][0]["travelDurationTraffic"]

     {
        :traffic_congestion => traffic_congestion,
        :travel_distance    => travel_distance *0.6,
        :traffic_time       => traffic_time  / 60
     }     
  end
end

