'use strict';
const DATE = {
    'year': '',
    'month': '',
}

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
    //     'group': 'Moradia',
    //     'fixed': true
    // },
    // {
    //     'id': 1,
    //     'title': 'Almoço',
    //     'value': 15,
    //     'group': 'Alimentação',
    //     'fixed': false
    // },
    // {
    //     'id': 2,
    //     'title': 'Gasolina',
    //     'value': 50,
    //     'group': 'Transporte',
    //     'fixed': false
    // },
    // {
    //     'id': 3,
    //     'title': 'Mercado',
    //     'value': 35,
    //     'group': 'Alimentação',
    //     'fixed': false
    // },
]


$(document).ready(function () {
    $('.calendar-select').calendar({
        type: 'month',
        maxDate: new Date(),
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
    // mount_charts_expense();
    // mount_charts_earnings();
    // mount_table();
});


function changeDate(date) {
    DATE.month = date.getMonth() + 1;
    DATE.year = date.getFullYear();
    console.log('DATE:',DATE)
}


$('form.earnings-form').on('submit', function (e) {
    e.preventDefault();
    let title = $('form.earnings-form input[name="title"]').val();
    let value = string_to_value($('form.earnings-form input[name="value"]').val());
    clear_form(this);

    append_earnings({
        'id': $('tr[data-earnings-id]').length,
        'title': title,
        'value': value,
        'fixed': false
    })

    new PNotify({
        title: 'Salvo com sucesso',
        delay: 1000,
        type: 'success',
        styling: 'bootstrap3'
    });
})


$('form.expense-form').on('submit', function (e) {
    e.preventDefault();
    let title = $('form.expense-form input[name="title"]').val();
    let value = string_to_value($('form.expense-form input[name="value"]').val());
    let group = $('form.expense-form select[name="group"]').val();
    clear_form(this);

    append_expanse({
        'id': $('tr[data-expense-id]').length,
        'title': title,
        'value': value,
        'group': group,
        'fixed': false
    })

    new PNotify({
        title: 'Salvo com sucesso',
        delay: 1000,
        type: 'success',
        styling: 'bootstrap3'
    });
})


function clear_form(form) {
    $(form).find('input').val('');
    $(form).find('input[name="title"]').focus();
}

$('.table-editable').on('focusin', 'input', function () {
    let value = this.value;
    $(this).on('focusout', function () {
        if (!this.value) {
            this.value = value;
        };
        $(this).off('focusout');
    })
})

$('.table-editable').on('click', '.trash', function () {
    $(this).closest('tr').remove();
    new PNotify({
        title: 'Excluido com sucesso',
        delay: 1000,
        type: 'success',
        styling: 'bootstrap3'
    });
})

$('.table-editable').on('click', '.fix', function () {

    let message = ''

    if ($(this).hasClass('fix-active')) {
        $(this).removeClass('fix-active')
        message = 'Item Desfixado'
    } else {
        $(this).addClass('fix-active')
        message = 'Item Fixado'
    }

    new PNotify({
        title: message,
        delay: 1000,
        type: 'success',
        styling: 'bootstrap3',
    });
})


function mount_charts_earnings() {

    if (typeof (Chart) === 'undefined') { return; }

    let labels=[], data=[], colors=[];
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
        
        let labels=[], data=[], colors=[];
        EXPENSES.forEach(function (e, i) {
            labels.push(e.title)
            data.push(e.value)
            colors.push(COLORS[i])
        })

        var chart_doughnut_settings = {
            type: 'doughnut',
            tooltipFillColor: "rgba(51, 51, 51, 0.55)",
            data: {
                labels:labels,
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

function mount_table() {
    EARNINGS.forEach(function (e) {
        append_earnings(e)
    })

    EXPENSES.forEach(function (e) {
        append_expanse(e)
    })
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
    if (earnings.fixed) {
        $('.earnings-tbody tr[data-earnings-id="' + earnings.id + '"] .fix').addClass('fix-active');
    }
    EARNINGS.push(earnings)
    // mount_charts_earnings();
}

function append_expanse(expense) {
    $('.expense-tbody').prepend('\
            <tr data-expense-id="'+ expense.id + '">\
                <td><input type="text" name="title" class="" value="'+ expense.title + '" autocomplete="false"></td>\
                <td><input type="text" name="value" placeholder="R$ 0,00" class="mask_money" value="" autocomplete="false"></td>\
                <td>\
                    <select class="" name="group">\
                        <option value="Alimentação">Alimentação</option>\
                        <option value="Estudo">Estudo</option>\
                        <option value="Transporte">Transporte</option>\
                        <option value="Moradia">Moradia</option>\
                    </select>\
                </td>\
                <td class="actions">\
                    <a href="javascript:;" class="fix"><i class="fa fa-thumb-tack"></i></a>\
                    <a href="javascript:;" class="trash"><i class="fa fa-trash"></i></a>\
                </td>\
            </tr>');

    $('.expense-tbody tr[data-expense-id="' + expense.id + '"] select').val(expense.group)
    set_mask('.expense-tbody tr[data-expense-id="' + expense.id + '"] .mask_money', expense.value)
    if (expense.fixed) {
        $('.expense-tbody tr[data-expense-id="' + expense.id + '"] .fix').addClass('fix-active');
    }
    EXPENSES.push(expense);
    // mount_charts_expense();

    let total=0;
    EXPENSES.forEach(function(e){
        total = total + e.value;
    })

    $('.expense-content .table-info .value-total').text(value_to_string(total));

    $('.progress-bar-total-month .progress-bar').attr({
        'data-transitiongoal': (total*100)/2000>100 ? 100 : (total*100)/2000,
        'data-original-title': Math.trunc((total*100)/2000)+'%'}
        ).progressbar();
}



function log(text){
    return console.log(text);
}