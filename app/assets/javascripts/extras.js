

$(window).bind('scroll', function () {
    if ($(window).scrollTop() > 65) {
        $('.fixedmenu').addClass('fixed');
    } else {
        $('.fixedmenu').removeClass('fixed');
    }
});

$(window).bind('scroll', function () {
    if ($(window).scrollTop() > 65) {
        $('.top_container').addClass('fixed');
    } else {
        $('.top_container').removeClass('fixed');
    }
});

$(window).bind('scroll', function () {
    if ($(window).scrollTop() > 65) {
        $('#navbar_header').addClass('fixed-text');
    } else {
        $('#navbar_header').removeClass('fixed-text');
    }
});

$(window).bind('scroll', function () {
    if ($(window).scrollTop() > 65) {
        $('.menutext').addClass('fixedtext');
    } else {
        $('.menutext').removeClass('fixedtext');
    }
});

$(window).bind('scroll', function () {
    if ($(window).scrollTop() > 65) {
        $('.fixedlogo').show();
    } else {
        $('.fixedlogo').hide();
    }
});


$(window).bind('scroll', function () {
    if ($(window).scrollTop() < 65) {
        $('.nav').css("margin-top", "3em");
    } else {
        $('.nav').css("margin-top", "0px");
    }
});

$(document).ready(function() {
  $("a.fancybox").fancybox();
});




