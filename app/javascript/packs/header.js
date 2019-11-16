$(document).on('turbolinks:load', function () {
    let oldScrollY = 0,
        header = $('.header');

    $(window).scroll(function () {
        let scrolled = window.pageYOffset || document.documentElement.scrollTop,
            dY = scrolled - oldScrollY;

        if (scrolled > 200) {
            header.addClass('scrolled');
            if (dY < 0) {
                header.addClass('active animated');
            } else {
                header.removeClass('active');
            }
        }

        if (scrolled <= 20) {
            header.removeClass('scrolled active animated');
        }

        oldScrollY = scrolled;
        return false;
    });
});