require 'restclient'

tcx_files = Dir["#{ENV['STRAVA_ACTIVITY_PATH']}/*.tcx"]

tcx_files.each do |file|
  puts "uploading #{file}"
  begin
    RestClient.post(
      'https://log.finalsurge.com/DeviceImport/Garmin/Upload.cshtml?t=TCX',
      {'FileUpload1' => File.open(file)},
      {'Cookie' => ENV['FINALSURGE_COOKIE']}
    )
  rescue RestClient::Found => _
  rescue => e
    puts "Error caught = #{e}"
  end
end
