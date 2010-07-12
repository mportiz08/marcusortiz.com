<?php
function getTweet()
{
  // check rate limit
  $url = "http://api.twitter.com/1/account/rate_limit_status.json";
  $json = file_get_contents($url);
  $response = json_decode($json, true);
  $limit_exceeded = $response["remaining_hits"] == 0;
  
  // request tweet
  $url = "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=mportiz08&count=1";
  $json = file_get_contents($url);
  $response = json_decode($json, true);

  if(is_null($response) || $limit_exceeded)
  {
    echo "Not available at this time, try again later.";
  }
  else
  {
    //var_dump($response);
    echo $response[0]["text"];
  }
}
?>
