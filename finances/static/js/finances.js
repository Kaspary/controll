'use strict';
const DATE = {
    'year': '',
    'month': '',
    'day': ''
}

var CHART_COLORS = [
    "#023fa5", "#7d87b9", "#bec1d4", "#d6bcc0", "#bb7784", "#8e063b", "#4a6fe3", "#8595e1", "#b5bbe3", "#e6afb9", "#e07b91", "#d33f6a", "#11c638", "#8dd593", "#c6dec7", "#ead3c6", "#f0b98d", "#ef9708", "#0fcfc0", "#9cded6", "#d5eae7", "#f3e1eb", "#f6c4e1", "#f79cd4"
]

const COLORS = [
    '#d9534f', //red
    '#26B99A', //green
    '#3498DB', //blue
    '#f0ad4e', //yelow

    '#de6c69', //red clean
    '#46c3a9', //green clean
    '#52a7e0', //blue clean
    '#f2b968', //yelow clean

    '#9b59b6', //purple

    '#03586a', //green dark
]

var EARNINGS = [
    // {
    //     'id': 1,
    //     'title': 'Trabalho',
    //     'value': 10000,
    //     'fixed': true
    // },
    // {
    //     'id': 2,
    //     'title': 'Extra',
    //     'value': 5000,
    //     'fixed': false
    // }
]

var EXPENSES = [
    // {
    //     'id': 4,
    //     'title': 'Aluguel',
    //     'value': 500,
    //     'category': 'Moradia',
    //     'fixed': true
    // },
    // {
    //     'id': 1,
    //     'title': 'Almoço',
    //     'value': 15,
    //     'category': 'Alimentação',
    //     'fixed': false
    // },
    // {
    //     'id': 2,
    //     'title': 'Gasolina',
    //     'value': 50,
    //     'category': 'Transporte',
    //     'fixed': false
    // },
    // {
    //     'id': 3,
    //     'title': 'Mercado',
    //     'value': 35,
    //     'category': 'Alimentação',
    //     'fixed': false
    // },
]



$(document).ready(function () {
    $('.calendar-select').calendar({
        type: 'month',
        maxDate: new Date().addMonths(1),
        minDate: new Date('2019, 1'),
        text: {
            days: ["D", "S", "T", "Q", "Q", "S", "S"],
            months: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
            monthsShort: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
        },
        onChange: function (date) {
            changeDate(date)
        },
    });
    $('.calendar-select').calendar('set date', new Date());
});


function changeDate(date) {
    DATE.month = date.getMonth() + 1;
    DATE.year = date.getFullYear();
    DATE.day = date.getDate();
    ajax_get_finances();
    console.log('DATE:', DATE)
}


$('form.earnings-form').on('submit', function (e) {
    e.preventDefault();
    let form = this;
    let title = $('form.earnings-form input[name="title"]').val();
    let value = $('form.earnings-form input[name="value"]').maskMoney("unmasked")[0]

    $.ajax({
        url: $('#save_earnings_url').val(),
        method: 'POST',
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRFToken', $('#csrf_token_url').val());
        },
        data: {
            'title': title,
            'value': value,
            'date': JSON.stringify(DATE),
        },
        success: function (data) {
            console.log(data)
            if (data.status == 'success') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'success',
                    styling: 'bootstrap3'
                });
                
                set_total_earning(data.earning.total)
                append_earnings(data.earning.earning)

                clear_form(form);

            } else if (data.status == 'error') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'error',
                    styling: 'bootstrap3'
                });
            }
        },
        error: function (e) {
        },
    });
})


$('form.expense-form').on('submit', function (e) {
    e.preventDefault();
    let form = this;
    let title = $('form.expense-form input[name="title"]').val();
    let value = $('form.expense-form input[name="value"]').maskMoney("unmasked")[0]
    let category = $('form.expense-form select[name="category"]').val();

    $.ajax({
        url: $('#save_expense_url').val(),
        method: 'POST',
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRFToken', $('#csrf_token_url').val());
        },
        data: {
            'title': title,
            'value': value,
            'category': category,
            'date': JSON.stringify(DATE),
        },
        success: function (data) {
            console.log(data)
            if (data.status == 'success') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'success',
                    styling: 'bootstrap3'
                });

                set_total_expanse(data.expense.total)

                append_expanse(data.expense.expense, data.expense.category)

                clear_form(form);

            } else if (data.status == 'error') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'error',
                    styling: 'bootstrap3'
                });
            }
        },
        error: function (e) {
        },
    });
})


function clear_form(form) {
    $(form).find('input').val('');
    $(form).find('input[name="title"]').focus();
}

$('.earnings-content .table-editable').on('focusin', 'input', function () {
    let value = this.value;

    $(this).on('keyup', function (e) {
        if (e.which == 13) {
            $(this).off('keyup').blur();
        }
    })

    $(this).on('focusout', function (e) {

        if (!this.value) {
            this.value = value;
        } else if (this.value != value){

            let earning_id = $(this).closest('tr').attr('data-earnings-id')
            let title = $('tr[data-earnings-id="' + earning_id + '"] input[name="title"]').val();
            let value = $('tr[data-earnings-id="' + earning_id + '"] input[name="value"]').maskMoney("unmasked")[0]
            
            $.ajax({
                url: $('#edit_earnings_url').val(),
                method: 'POST',
                beforeSend: function (request) {
                    return request.setRequestHeader('X-CSRFToken', $('#csrf_token_url').val());
                },
                data: {
                    'id': earning_id,
                    'title': title,
                    'value': value,
                    'date': JSON.stringify(DATE),
                },
                success: function (data) {
                    console.log(data)
                    if (data.status == 'success') {
                        new PNotify({
                            title: data.message_title,
                            text: '',
                            delay: 1000,
                            type: 'success',
                            styling: 'bootstrap3'
                        });
                        
                        set_total_earning(data.earning.total)
                        $('tr[data-earnings-id="' + data.earning.earning.id + '"] input[name="title"]').val(data.earning.earning.title);
                        set_mask('tr[data-earnings-id="' + data.earning.earning.id + '"] .mask_money', data.earning.earning.value)
                        
                    } else if (data.status == 'error') {
                        new PNotify({
                            title: data.message_title,
                            text: '',
                            delay: 1000,
                            type: 'error',
                            styling: 'bootstrap3'
                        });
                    }
                },
                error: function (e) {
                },
            })

            let total = 0;
            EARNINGS.forEach(function (e) {
                if (e.id == earning_id) {
                    e.value = $('tr[data-earnings-id="' + earning_id + '"] .mask_money').maskMoney("unmasked")[0]
                }
                total = total + e.value;
            })
    
            $('.earnings-content .table-info .value-total').text(value_to_string(total));
            $('.progress-bar-total-month [data-total-earnings]').attr({ 'data-total-earnings': total })
    
            update_progress_bar();

        }
        $(this).off('focusout').blur();
    })
})

$('.expense-content .table-editable').on('focusin', 'input, select', function () {

    let value = this.value;

    $(this).on('keyup', function (e) {
        if (e.which == 13) {
            $(this).off('keyup').blur();
        }
    })

    $(this).on('focusout change', function () {
        if (!this.value) {
            this.value = value;
        } else if (this.value != value){


            let expense_id = $(this).closest('tr').attr('data-expense-id')
            let title = $('tr[data-expense-id="' + expense_id + '"] input[name="title"]').val();
            let value = $('tr[data-expense-id="' + expense_id + '"] input[name="value"]').maskMoney("unmasked")[0]
            let category = $('tr[data-expense-id="' + expense_id + '"] select[name="category"]').val()
            
            $.ajax({
                url: $('#edit_expense_url').val(),
                method: 'POST',
                beforeSend: function (request) {
                    return request.setRequestHeader('X-CSRFToken', $('#csrf_token_url').val());
                },
                data: {
                    'id': expense_id,
                    'title': title,
                    'value': value,
                    'category':category,
                    'date': JSON.stringify(DATE),
                },
                success: function (data) {
                    console.log(data)
                    if (data.status == 'success') {
                        new PNotify({
                            title: data.message_title,
                            text: '',
                            delay: 1000,
                            type: 'success',
                            styling: 'bootstrap3'
                        });
                        
                        set_total_expanse(data.expense.total)
                        $('tr[data-expense-id="' + data.expense.expense.id + '"] input[name="title"]').val(data.expense.expense.title);
                        $('tr[data-expense-id="' + data.expense.expense.id + '"] select[name="category"]').val(data.expense.expense.category);
                        set_mask('tr[data-expense-id="' + data.expense.expense.id + '"] .mask_money', data.expense.expense.value)
                        
                    } else if (data.status == 'error') {
                        new PNotify({
                            title: data.message_title,
                            text: '',
                            delay: 1000,
                            type: 'error',
                            styling: 'bootstrap3'
                        });
                    }
                },
                error: function (e) {
                },
            })

            let total = 0;
            EXPENSES.forEach(function (e) {
                if (e.id == expense_id) {
                    e.value = $('tr[data-expense-id="' + expense_id + '"] .mask_money').maskMoney("unmasked")[0]
                }
                total = total + e.value;
            })

            $('.expense-content .table-info .value-total').text(value_to_string(total));

            $('.progress-bar-total-month [data-total-expense]').attr({ 'data-total-expense': total })

            update_progress_bar();

        };
        $(this).off('focusout change').blur();
    })
})

$('.earnings-content .table-editable').on('click', '.trash', function () {

    let earning_id = $(this).closest('tr').attr('data-earnings-id')

    $.ajax({
        url: $('#remove_earnings_url').val(),
        method: 'POST',
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRFToken', $('#csrf_token_url').val());
        },
        data: {
            'id': earning_id,
            'date': JSON.stringify(DATE),
        },
        success: function (data) {
            console.log(data)
            if (data.status == 'success') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'success',
                    styling: 'bootstrap3'
                });
                
                set_total_earning(data.earning.total)
                $('tr[data-earnings-id="' + data.earning.earning.id + '"]').remove();

            } else if (data.status == 'error') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'error',
                    styling: 'bootstrap3'
                });
            }
        },
        error: function (e) {
        },
    })
})

$('.expense-content .table-editable').on('click', '.trash', function () {

    let expense_id = $(this).closest('tr').attr('data-expense-id')

    $.ajax({
        url: $('#remove_expense_url').val(),
        method: 'POST',
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRFToken', $('#csrf_token_url').val());
        },
        data: {
            'id': expense_id,
            'date': JSON.stringify(DATE),
        },
        success: function (data) {
            console.log(data)
            if (data.status == 'success') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'success',
                    styling: 'bootstrap3'
                });

                set_total_expanse(data.expense.total)
                $('tr[data-expense-id="' + data.expense.expense.id + '"]').remove();

            } else if (data.status == 'error') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'error',
                    styling: 'bootstrap3'
                });
            }
        },
        error: function (e) {
        },
    })
})

$('.earnings-content .table-editable').on('click', '.fix', function () {

    let earning_id = $(this).closest('tr').attr('data-earnings-id')

    let fixed =  !$(this).hasClass('fix-active') ? true : false

    $.ajax({
        url: $('#fix_earnings_url').val(),
        method: 'POST',
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRFToken', $('#csrf_token_url').val());
        },
        data: {
            'id': earning_id,
            'fixed': fixed
        },
        success: function (data) {
            console.log(data)
            if (data.status == 'success') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'success',
                    styling: 'bootstrap3'
                });

                if (data.earning.earning.fixed=='true') {
                    $('tr[data-earnings-id="' + data.earning.earning.id + '"] .fix').addClass('fix-active');
                } else {
                    $('tr[data-earnings-id="' + data.earning.earning.id + '"] .fix').removeClass('fix-active');
                }

            } else if (data.status == 'error') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'error',
                    styling: 'bootstrap3'
                });
            }
        },
        error: function (e) {
        },
    })
})

$('.expense-content .table-editable').on('click', '.fix', function () {

    let expense_id = $(this).closest('tr').attr('data-expense-id')

    let fixed =  !$(this).hasClass('fix-active') ? true : false

    $.ajax({
        url: $('#fix_expense_url').val(),
        method: 'POST',
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRFToken', $('#csrf_token_url').val());
        },
        data: {
            'id': expense_id,
            'fixed': fixed
        },
        success: function (data) {
            console.log(data)
            if (data.status == 'success') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'success',
                    styling: 'bootstrap3'
                });

                if (data.expense.expense.fixed=='true') {
                    $('tr[data-expense-id="' + data.expense.expense.id + '"] .fix').addClass('fix-active');
                } else {
                    $('tr[data-expense-id="' + data.expense.expense.id + '"] .fix').removeClass('fix-active');
                }

            } else if (data.status == 'error') {
                new PNotify({
                    title: data.message_title,
                    text: '',
                    delay: 1000,
                    type: 'error',
                    styling: 'bootstrap3'
                });
            }
        },
        error: function (e) {
        },
    })
})

function mount_charts_earnings() {

    if (typeof (Chart) === 'undefined') { return; }

    let labels = [], data = [], colors = [];
    EARNINGS.forEach(function (e, i) {
        labels.push(e.title)
        data.push(e.value)
        colors.push(COLORS[i])
    })

    if ($('#earnings_chart').length) {
        var chart_doughnut_settings = {
            type: 'doughnut',
            tooltipFillColor: "rgba(51, 51, 51, 0.55)",
            data: {
                labels: labels,
                datasets: [{
                    data: data,
                    backgroundColor: colors,
                    hoverBackgroundColor: colors
                }]
            },
            options: {
                legend: false,
                responsive: true,
                tooltips: {
                    //https://stackoverflow.com/questions/37257034/chart-js-2-0-doughnut-tooltip-percentages
                    callbacks: {
                        label: function (tooltipItem, data) {
                            let label = data.labels[tooltipItem.index]
                            let dataset = data.datasets[tooltipItem.datasetIndex];
                            let meta = dataset._meta[Object.keys(dataset._meta)[0]];
                            let total = meta.total;
                            let currentValue = dataset.data[tooltipItem.index];
                            let percentage = Math.floor(((currentValue / total) * 100) + 0.5);
                            return label + ' (' + percentage + '%)';
                        }
                    }
                }
            }
        }

        $('#earnings_chart').each(function () {

            var chart_element = $(this);
            var chart_doughnut = new Chart(chart_element, chart_doughnut_settings);

        });
    }
}

function mount_charts_expense() {


    if ($('#expense_chart').length) {

        let labels = [], data = [], colors = [];
        EXPENSES.forEach(function (e, i) {
            labels.push(e.title)
            data.push(e.value)
            colors.push(COLORS[i])
        })

        var chart_doughnut_settings = {
            type: 'doughnut',
            tooltipFillColor: "rgba(51, 51, 51, 0.55)",
            data: {
                labels: labels,
                datasets: [{
                    data: data,
                    backgroundColor: colors,
                    hoverBackgroundColor: colors,
                }]
            },
            options: {
                legend: false,
                responsive: true,
                tooltips: {
                    //https://stackoverflow.com/questions/37257034/chart-js-2-0-doughnut-tooltip-percentages
                    callbacks: {
                        label: function (tooltipItem, data) {
                            let label = data.labels[tooltipItem.index]
                            let dataset = data.datasets[tooltipItem.datasetIndex];
                            let meta = dataset._meta[Object.keys(dataset._meta)[0]];
                            let total = meta.total;
                            let currentValue = dataset.data[tooltipItem.index];
                            let percentage = Math.floor(((currentValue / total) * 100) + 0.5);
                            return label + ' (' + percentage + '%)';
                        }
                    }
                }
            }
        }

        $('#expense_chart').each(function () {

            var chart_element = $(this);
            var chart_doughnut = new Chart(chart_element, chart_doughnut_settings);

        });
    }
}

function mount_table(earnings, expense) {
    if (earnings) {
        earnings.earnings.forEach(function (e) {
            append_earnings(e)
        })
    }
    if (expense) {
        expense.expense.forEach(function (e) {
            append_expanse(e, expense.category)
        })
    }
}

function append_earnings(earnings) {
    $('.earnings-tbody').prepend('\
    <tr data-earnings-id="'+ earnings.id + '">\
        <td><input type="text" name="title" class="" value="'+ earnings.title + '" autocomplete="false"></td>\
        <td><input type="text" name="value" placeholder="R$ 0,00" class="mask_money" value="" autocomplete="false"></td>\
        <td class="actions">\
            <a href="javascript:;" class="fix"><i class="fa fa-thumb-tack"></i></a>\
            <a href="javascript:;" class="trash"><i class="fa fa-trash"></i></a>\
        </td>\
    </tr>');
    set_mask('.earnings-tbody tr[data-earnings-id="' + earnings.id + '"] .mask_money', earnings.value)

    earnings.fixed ? $('.earnings-tbody tr[data-earnings-id="' + earnings.id + '"] .fix').addClass('fix-active') : '';

}

function append_expanse(expense, category) {

    let option=''
    category.forEach(function (e) {
        option = option + "<option value="+e.id+">"+e.title+"</option>"
    })

    $('.expense-tbody').prepend('\
            <tr data-expense-id="'+ expense.id + '">\
                <td><input type="text" name="title" class="" value="'+ expense.title + '" autocomplete="false"></td>\
                <td><input type="text" name="value" placeholder="R$ 0,00" class="mask_money" value="" autocomplete="false"></td>\
                <td>\
                    <select class="" name="category">\
                        '+ option +'\
                    </select>\
                </td>\
                <td class="actions">\
                    <a href="javascript:;" class="fix"><i class="fa fa-thumb-tack"></i></a>\
                    <a href="javascript:;" class="trash"><i class="fa fa-trash"></i></a>\
                </td>\
            </tr>');

    $('.expense-tbody tr[data-expense-id="' + expense.id + '"] select[name="category"]').val(expense.category)
    set_mask('.expense-tbody tr[data-expense-id="' + expense.id + '"] .mask_money', expense.value)
    expense.fixed ? $('.expense-tbody tr[data-expense-id="' + expense.id + '"] .fix').addClass('fix-active') : '';
}

function set_total_expanse(total){
    $('.expense-content .table-info .value-total').text(value_to_string(total));
    $('.progress-bar-total-month [data-total-expense]').attr({ 'data-total-expense': total })
    update_progress_bar();
}

function set_total_earning(total){
    $('.earnings-content .table-info .value-total').text(value_to_string(total));
    $('.progress-bar-total-month [data-total-earnings]').attr({ 'data-total-earnings': total })
    update_progress_bar();
}


function update_progress_bar() {

    let earnings = $('.progress-bar-total-month [data-total-earnings]').attr('data-total-earnings')
    let expense = $('.progress-bar-total-month [data-total-expense]').attr('data-total-expense')
    
    let data_transitiongoal = 0
    let data_original_title = '0%'
    
    if ((expense*100)/earnings<=100){
        data_transitiongoal = (expense*100)/earnings
        data_original_title = Math.trunc((expense*100)/earnings) + '%'
    } else if ((expense*100)/earnings >100){
        data_transitiongoal = 100
        data_original_title = '100%'
    }

    $('.progress-bar-total-month [data-total-expense]').attr({
        'data-transitiongoal': data_transitiongoal,
        'data-original-title': data_original_title
    }).progressbar();
}

function ajax_get_finances() {
    $.ajax({
        url: $('#get_finances_url').val(),
        method: 'POST',
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRFToken', $('#csrf_token_url').val());
        },
        data: {
            'date': JSON.stringify(DATE),
        },
        success: function (data) {
            if (data.status == 'success') {
                clear_data();
                set_total_earning(data.earnings.total)
                set_total_expanse(data.expense.total)
                mount_table(data.earnings, data.expense);
            } else if (data.status == 'error') {
            }
        },
        error: function (e) {
        },
    });
}

function clear_data() {
    $('.earnings-tbody, .expense-tbody').html('')
    $('.earnings-content .table-info .value-total, .expense-content .table-info .value-total').text('---')

    $('.progress-bar-total-month [data-total-earnings]').attr({ 'data-total-earnings': 0 })
    $('.progress-bar-total-month [data-total-expense]').attr({ 'data-total-expense': 0, 'data-original-title': '0%' }).progressbar();

    EXPENSES = []
    EARNINGS = []
}