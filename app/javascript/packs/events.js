$(document).ready(function () {
    $('.read-more').on('click', function () {
        let desc = $(this).parents('.events-row__info').children('.events-row__desc'),
            text_height = desc.children('.events-row__desc-inner').outerHeight();
        $(this).toggleClass('active')

        if ($(this).hasClass('active')) {
            desc.css('height', text_height)
        } else {
            desc.removeAttr('style')
        }
    })
});