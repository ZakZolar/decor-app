/*

WIWET.com - ASP.NET Templates

Soul Template

*/
$(document).ready(function(){
  var screenWidth = $(window).width();
  var screenHeight = $(window).height();
  var topBar = $(".top-bar").height();
  var navBar = $("header").height();
  var footer = $("footer").height();

  $("[data-toggle=popover]").popover();
  $('.scrollup').click(function(){
    $("html, body").animate({ scrollTop: 0 }, 700);
    return false;
  });

  $(".page-wrap").css("min-height", screenHeight - topBar - navBar - footer  + "px");

  $(".portfolio-item,.team-desc").click(function(){
    $(".portfolio-item-hover,.team-desc-hover").css("opacity","0");
    $(this).find(".portfolio-item-hover,.team-desc-hover").css("opacity","1");
  });
  if (screenWidth < 768) {
    $(".wiwet-navigation").css("min-height",$(document).height() + "px");
  }

  //animations start
$(".titleAnimation").addClass("animated shake");
if (screenWidth > 767) {
  var waypoints = $('body').waypoint({
    handler: function(direction) {
      $(".fadeUpEffect,.fadeUpEffect1,.fadeUpEffect2,.fadeUpEffect3,.fadeUpEffect4,.fadeRightEffect,.fadeLeftEffect,.fadeRightEffect1,.fadeLeftEffect1").addClass("hiddenFromView");
    }
  });


var waypoints = $('.fadeUpEffect').waypoint({
  handler: function(direction) {
    $(".fadeUpEffect").addClass("animated fadeInUp");
  },offset: '90%'
});
var waypoints = $('.fadeUpEffect1').waypoint({
  handler: function(direction) {
    $(".fadeUpEffect1").addClass("animated fadeInUp");
  },offset: '90%'
});
var waypoints = $('.fadeUpEffect2').waypoint({
  handler: function(direction) {
    $(".fadeUpEffect2").addClass("animated fadeInUp");
  },offset: '90%'
});
var waypoints = $('.fadeUpEffect3').waypoint({
  handler: function(direction) {
    $(".fadeUpEffect3").addClass("animated fadeInUp");
  },offset: '90%'
});
var waypoints = $('.fadeUpEffect4').waypoint({
  handler: function(direction) {
    $(".fadeUpEffect4").addClass("animated fadeInUp");
  },offset: '100%'
});

var waypoints = $('.fadeLeftRight').waypoint({
  handler: function(direction) {
    $(".fadeLeftEffect").addClass("animated fadeInLeft");
    $(".fadeRightEffect").addClass("animated fadeInRight");
  },offset: '90%'
});

var waypoints = $('.fadeLeftRight1').waypoint({
  handler: function(direction) {
    $(".fadeLeftEffect1").addClass("animated zoomInLeft");
    $(".fadeRightEffect1").addClass("animated zoomInRight");
  },offset: '90%'
});

var waypoints = $('.countNumbers').waypoint({
  handler: function(direction) {
    $('.count-shares').countTo({from: 0, to: 3456, speed: 3000,refreshInterval: 100});
    $('.count-sales').countTo({from: 0, to: 1569, speed: 3000,refreshInterval: 100});
    $('.count-likes').countTo({from: 0, to: 4536, speed: 3000,refreshInterval: 100});
    $('.count-member').countTo({from: 0, to: 2698, speed: 3000,refreshInterval: 100});

    $('.count-standard').countTo({from: 0, to: 98, speed: 3000,refreshInterval: 100});
    $('.count-integration').countTo({from: 0, to: 32, speed: 3000,refreshInterval: 100});
    $('.count-requirements').countTo({from: 0, to: 13, speed: 3000,refreshInterval: 100});
  },offset: '90%'
});

var waypoints = $('.animateBars').waypoint({
  handler: function(direction) {
    var bar = $('.progress-bar');
    $(function(){
      $(bar).each(function(){
        bar_width = $(this).attr('aria-valuenow');
        $(this).width(bar_width + '%');
      });
    });
  },offset: '90%'
});
}
  //animations end

  (function ($) {
    $('.spinner .btn:first-of-type').on('click', function() {
      $('.spinner input').val( parseInt($('.spinner input').val(), 10) + 1);
    });
    $('.spinner .btn:last-of-type').on('click', function() {
      $('.spinner input').val( parseInt($('.spinner input').val(), 10) - 1);
    });
  })(jQuery);

  $(".user-dropdown a").click(function(){
    $('.user-dropdown-trigger').dropdown('toggle');
  });
  // currency dropdown
  $(".currency-dropdown label[for=dollarCurrency]").click(function(){
    $(".selected-currency").html("<i class='fa fa-dollar'></i>");
    $(".currency-trigger[data-toggle=dropdown]").dropdown("toggle");
  });
  $(".currency-dropdown label[for=euroCurrency]").click(function(){
    $(".selected-currency").html("<i class='fa fa-euro'></i>");
    $(".currency-trigger[data-toggle=dropdown]").dropdown("toggle");
  });
  $(".currency-dropdown label[for=yenCurrency]").click(function(){
    $(".selected-currency").html("<i class='fa fa-yen'></i>");
    $(".currency-trigger[data-toggle=dropdown]").dropdown("toggle");
  });
  $(".currency-dropdown label[for=gbpCurrency]").click(function(){
    $(".selected-currency").html("<i class='fa fa-gbp'></i>");
    $(".currency-trigger[data-toggle=dropdown]").dropdown("toggle");
  });

 $('body').on('click', function (e) {
    $('[data-toggle="popover"]').each(function () {
        //the 'is' for buttons that trigger popups
        //the 'has' for icons within a button that triggers a popup
        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide');
        }
    });
});

});

$(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
        $('.scrollup').fadeIn();
    } else {
        $('.scrollup').fadeOut();
    }
}); 

//Select the navigation menu base on URL.
$(function () {
    var path = window.location.pathname;
    path = path.replace(/\/$/, "");
    path = decodeURIComponent(path);
    if (path == '') {
        path = "/";
    }
    $(".nav a").each(function () {
        if ($(this).attr('href') == path) {
            $(this).parent().addClass("active");
        }
    });
});