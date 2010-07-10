<?php
function getSong($api_keyfile)
{
  $song = "last listened to ";
  $apikey = trim(file_get_contents($api_keyfile));
  $url = "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=chipitople&limit=1&format=json&api_key=" . $apikey;
  $json = file_get_contents($url);
  $response = json_decode($json, true);

  if(is_null($response))
  {
    $song = "no recently played song information available";
  }
  else
  {
    if(count($response["recenttracks"]["track"]) < 8)
    {
      $track = $response["recenttracks"]["track"][0];
    }
    else
    {
      $track = $response["recenttracks"]["track"];
    }
    $name = "<a href=\"" . $track["url"] . "\">\"" . $track["name"] . "\"</a>";
    $artist = $track["artist"]["#text"];
    $status = $track["@attr"]["nowplaying"];
    if($status == "true")
    {
      $song = "currently listening to ";
    }
    $song .= $name . " by " . $artist;
  }

  echo $song;
}
?>
