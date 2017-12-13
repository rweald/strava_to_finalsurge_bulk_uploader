# Strava -> FinalSurge Bulk Uploader
A hacky set of scripts to download all [Strava](http://strava.com/) activities as TCX files and then upload them to [FinalSurge](http://finalsurge.com/). 

I needed a way to efficiently move all my previous running data into FinalSurge to support some ultrarunning coaching. Didn't want to do this labor intense process manually so I wrote a couple scripts. Hope you find them helpful. 

#### Gotchas
* This is **not production quality code**, it worked when I needed it and I wanted to make it public in case others could make use of it.
* It uses a hack to fake the request that FinalSurge garmin upload web form was making. This is obviously brittle as any change to that forms inputs will break this script. 
  * If it does break you will need to use the chrome web inspector find the new form strucutre and update the finalsurge post request. 
  
## Usage

1. Grab your strava cookies using method of your choice. (I used chrome web inspector after normal web login) 
2. set `STRAVA_COOKIE` env variable to the above value. 
3. Grab your FinalSurge cookie using method of your choice. (Again I used chrome web inspector after normal web login) 
4. set `FINALSURGE_COOKIE` to the value obtained in step 3. 
5. set `STRAVA_API_ACCESS_TOKEN` to your strava api access token. 
6. set `STRAVA_ACTIVITY_PATH` to an existing directory where you want all your strava activites to download. 
7. Run: `ruby download_strava_data.rb`
8. Run: `ruby upload_to_finalsurge.rb` 
9. Use FinalSurge UI to add the newly uploaded files to your training log. 
