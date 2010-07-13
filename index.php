<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>coming soon</title>
  <link href="css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="background">
  <div id="container">
    <div id="top-bar">
      <div class="wrapper">
        <div id="song">
          <img src="img/itunes.png" />&nbsp;
          <?php 
            require "scripts/song.php";
            getSong("scripts/lastfm.key");
          ?>
        </div>
        <div id="links">
          <ul>
            <li><a href="http://facebook.com/marcusortiz"><img src="img/icon_facebook.png" /></a></li>
            <li><a href="http://twitter.com/mportiz08"><img src="img/icon_twitter.png" /></a></li>
            <li><a href="http://last.fm/user/chipitople"><img src="img/icon_lastfm.png" /></a></li>
            <li><a href="http://flickr.com/mportiz08"><img src="img/icon_flickr.png" /></a></li>
            <li><a href="http://delicious.com/chipitople"><img src="img/icon_delicious.png" /></a></li>
            <li><a href="http://digg.com/users/chipitople"><img src="img/icon_digg.png" /></a></li>
            <li><a href="http://vimeo.com/mportiz08"><img src="img/icon_vimeo.png" /></a></li>
            <li><a href="http://youtube.com/mportiz08"><img src="img/icon_youtube.png" /></a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="wrapper" id="main-wrapper">
      <div id="main-nav">
        <div id="logo"><a href="http://marcusortiz.com"><img src="img/logo.png" alt="marcusortiz.com" /></a></div>
        <div id="nav">
          <ul>
            <li><a href="">Home</a></li>
            <li><a href="">About</a></li>
            <li><a href="">Portfolio</a></li>
            <li><a href="">Contact</a></li>
          </ul>
        </div>
      </div>
      <div id="content">
        <div id="banner"><img src="img/banner.jpg" alt="test banner" /></div>
        <div id="banner-shadow"></div>
        <div id="blocks">
          <div class="column" id="aboutme">
            <div class="title"><h2>About Me</h2></div>
            <p align="center"><img src="img/me.jpg" alt="me" /></p>
            <p>I'm a college student studying Computer Science in Cal Poly San Luis Obispo.</p>
          </div>
          <div class="column" id="twitter">
            <div class="title"><h2>Twitter</h2></div>
            <div id="twitter-column">
              <p>
                <?php
                  require "scripts/tweet.php";
                  getTweet();
                ?>
              </p>
            </div>
          </div>
          <div class="column" id="contact">
            <div class="title"><h2>Contact</h2></div>
            <div class="contact-option" id="contact-phone">
              <h4>Phone</h4>
              (123) 456-7890
            </div>
            <div class="contact-option" id="contact-email">
              <h4>Email</h4>
              mportiz08[at]gmail.com
            </div>
            <div class="contact-option" id="contact-skype">
              <h4>Skype</h4>
              marcus.ortiz
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="footer-top"></div>
    <div id="footer-bottom">
      <div class="wrapper">
        <div id="copyright">&copy; 2010 Marcus Ortiz</div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
