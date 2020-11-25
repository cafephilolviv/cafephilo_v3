$(document).on('turbolinks:load', function () {
    $.each($('.event-desc'), function() {
        if($(this).outerHeight() > $(this).children('.event-desc-inner').outerHeight()) {
            $(this).removeClass('with-height');
            $(`.event-links[data-card-id=${$(this).attr('data-card-id')}]`).toggleClass('justify-content-between justify-content-end')
                                                                           .children('.read-more')
                                                                           .addClass('d-none');
        }
    })

    $('.read-more').on('click', function () {
        let desc = $(`.event-desc[data-card-id=${$(this).parent().attr('data-card-id')}]`),
            text_height = desc.children('.event-desc-inner').outerHeight();
        $(this).toggleClass('active');

        if ($(this).hasClass('active')) {
            desc.css('height', text_height);
        } else {
            desc.removeAttr('style');
        }
    })
});
