require 'strava/api/v3'
require 'restclient'

strava = Strava::Api::V3::Client.new(:access_token => ENV['STRAVA_API_ACCESS_TOKEN'])

activites = strava.list_athlete_activities({per_page: 200});

activites ||= []

activity_ids = activites.map do |activity|
  activity["id"]
end;

activity_ids.each do |id|
  puts "downloading activity = #{id}"

  resp = RestClient.get("https://www.strava.com/activities/#{id}/export_tcx", {'Cookie' => ENV['STRAVA_COOKIE']})

  File.write("#{ENV['STRAVA_ACTIVITY_PATH']}/#{id}.tcx", resp.body)
end
