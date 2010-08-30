$(document).ready(function() {
  // make code snippets look good
  $('code').addClass('prettyprint');
  prettyPrint();
  
  // add nice zoom effect to images
  $('.images a').fancybox({'hideOnContentClick': true});
});
