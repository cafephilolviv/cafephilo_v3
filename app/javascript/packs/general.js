$(document).on('turbolinks:load', function () {

    /*===========================================
       to_top
     ===========================================*/

    jQuery('.to_top').click(function () {
        jQuery('html, body').animate({
            scrollTop: 0
        }, 700);
        return false;
    });

    $(window).scroll(function () {
        if ($(this).scrollTop() > 150) {
            $('.to_top').show();
        } else {
            $('.to_top').hide();
        }
    })
});