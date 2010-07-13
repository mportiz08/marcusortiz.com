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
    $tweet = $response[0]["text"];
    $tweet = auto_link($tweet);
    
    echo $tweet;
  }
}

function auto_link($text)
{
  $pattern = "/(((http[s]?:\/\/)|(www\.))?(([a-z][-a-z0-9]+\.)?[a-z][-a-z0-9]+\.[a-z]+(\.[a-z]{2,2})?)\/?[a-z0-9._\/~#&=;%+?-]+[a-z0-9\/#=?]{1,1})/is";
  $text = preg_replace($pattern, " <a href='$1'>$1</a>", $text);
  $text = preg_replace("/href=\"www/", "href=\"http://www", $text);
  
  return $text;
}
?>
