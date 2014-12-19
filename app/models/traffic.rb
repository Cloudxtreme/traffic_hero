class Traffic < ActiveRecord::Base
  belongs_to :user

  def self.route_details(origin, destination)
     origin = URI.encode(origin)
     destination = URI.encode(destination)
     url = "http://dev.virtualearth.net/REST/V1/Routes?wp.0=#{origin}&wp.1=#{destination}&optmz=timeWithTraffic&key=AsSCfxqr3ZwDpzKWEY4VgAoinIugwTeGNm-dmaG9X718G1NQQlPlTfOV30AWYUCd"
  
     response = HTTParty.get url

     traffic_congestion = response["resourceSets"][0]["resources"][0]["trafficCongestion"]
     travel_distance    = response["resourceSets"][0]["resources"][0]["travelDistance"]*0.6
     traffic_time       = response["resourceSets"][0]["resources"][0]["travelDurationTraffic"]/60

     {
        :traffic_congestion => traffic_congestion,
        :travel_distance    => travel_distance.round(1),
        :traffic_time       => traffic_time  
     }

  end
end

