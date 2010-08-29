$(document).ready(function() {
  $('#bottom ul').bxSlider({
    alignment: 'horizontal',
    controls: true,
    speed: 500,
    pager: false,
    pager_short: false,
    next_text: 'next',
    next_image: '/images/arrow_right.jpg',
    prev_text: 'prev',
    prev_image: '/images/arrow_left.jpg',
    auto: false,
    ticker: false,
    stop_text: 'stop',
    start_text: 'start',
    wrapper_class: 'slider_wrapper'
  });
});
