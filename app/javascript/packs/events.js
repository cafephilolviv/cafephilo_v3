$(document).on('turbolinks:load', function () {
    $('.read-more').on('click', function () {
        let desc = $(this).parents('.event-row__info').children('.event-row__desc'),
            text_height = desc.children('.event-row__desc-inner').outerHeight();
        $(this).toggleClass('active')

        if ($(this).hasClass('active')) {
            desc.css('height', text_height)
        } else {
            desc.removeAttr('style')
        }
    })
});