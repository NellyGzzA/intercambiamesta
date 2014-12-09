//= require jquery
//= require snowfall.jquery.js
//= require bootstrap


jQuery(function ($) {
    $('.signin-header').snowfall();

    $('a.registration').popover({
        animation: false,
        trigger: 'manual',
        html: true,
        content: '¿Quieres organizar un intercambio? <strong>¡Regístrate!</strong>'
    }).popover('show');

    $(window).on('resize', function () {
        $('a.registration').popover('show');
    });
});