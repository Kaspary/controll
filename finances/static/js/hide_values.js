$('#hide_values').on('click', function () {

    $(this).off('mouseover', 'focusin')

    if (!$(this).hasClass('hide-values-active')) {
        $(this).addClass('hide-values-active menu-active');
        $('.hide-values').addClass('hide-values-active').css({ '-webkit-text-security': 'disc' });
        $('body').on('mouseover', '.hide-values.hide-values-active', function () {
            $(this).css({ '-webkit-text-security': 'unset' });

            $(this).on('mouseleave', function () {
                $(this).css({ '-webkit-text-security': 'disc' });
                $(this).off('mouseleave')
            })
        })

        $('body').on('focusin', '.hide-values.hide-values-active', function () {

            $(this).off('mouseleave')
            $(this).css({ '-webkit-text-security': 'unset' });
            $(this).on('focusout', function () {
                $(this).css({ '-webkit-text-security': 'disc' });
                $(this).off('focusout')
            })
        })

        $('.hide-values-chart').addClass('hide-values-active')
        $('.hide-values-chart div[data-total-earnings], .hide-values-chart div[data-total-expense]').css({'background':'#337ab7'})

        $('body').on('mouseover', '.progress-bar-total-month.hide-values-active', function () {
            
            $('.hide-values-chart div[data-total-earnings]').css({'background':'#1ABB9C'})
            $('.hide-values-chart div[data-total-expense]').css({'background':'#ff7676'})

            $(this).on('mouseleave', function () {
                $('.hide-values-chart div[data-total-earnings], .hide-values-chart div[data-total-expense]').css({'background':'#337ab7'})
                $(this).off('mouseleave')
            })
        })

    } else {
        $(this).removeClass('hide-values-active menu-active');
        $('.hide-values-chart div[data-total-earnings]').css({'background':'#1ABB9C'})
        $('.hide-values-chart div[data-total-expense]').css({'background':'#ff7676'})
        $('.progress-bar-total-month').removeClass('hide-values-active')
        $('.hide-values').removeClass('hide-values-active').css({ '-webkit-text-security': 'unset' });
    }
})

$('tbody').on('appendTableEditable', function (e, item) {
    
    if ($('#hide_values').hasClass('hide-values-active')) {
        $(item).find('.hide-values').addClass('hide-values-active').css({ '-webkit-text-security': 'disc' });
        $('body').on('mouseover', '.hide-values.hide-values-active', function () {
            $(this).css({ '-webkit-text-security': 'unset' });

            $(this).on('mouseleave', function () {
                $(this).css({ '-webkit-text-security': 'disc' });
                $(this).off('mouseleave')
            })
        })

        $('body').on('focusin', '.hide-values.hide-values-active', function () {

            $(this).off('mouseleave')
            $(this).css({ '-webkit-text-security': 'unset' });
            $(this).on('focusout', function () {
                $(this).css({ '-webkit-text-security': 'disc' });
                $(this).off('focusout')
            })
        })
    }
})