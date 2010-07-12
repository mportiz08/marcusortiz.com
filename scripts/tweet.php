<?php
function getTweet()
{
  $url = "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=mportiz08&count=1"
  $json = file_get_contents($url);
  $response = json_decode($json, true);

  if(is_null($response))
  {
    echo "Not available at this time, try again later."
  }
  else
  {
    // TODO
  }
}
?>
