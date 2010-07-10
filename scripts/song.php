<?php
$song = "last listened to ";
$keyfile = fopen("lastfm.key", "r");
$apikey = trim(fgets($keyfile));
$url = "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=chipitople&limit=1&format=json&api_key=" . $apikey;
$json = file_get_contents($url);
$response = json_decode($json, true);

if(is_null($response))
{
  $song = "no recently played song information available";
}
else
{
  $track = $response["recenttracks"]["track"][0];
  $name = $track["name"];
  $artist = $track["artist"]["#text"];
  $status = $track["@attr"]["nowplaying"];
  if($status == "true")
  {
    $song = "currently listening to ";
  }
  $song .= '"' . $name . '"' . " by " . $artist;
}

echo $song;
?>
