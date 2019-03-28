//--------Mask------------

//function add_mask() {
$(".mask_phone").keyup(function() {
    var valor = $(this).val().length;
    if (valor > 14) {
        $('.mask_phone').mask('(00) 00000-0000');
    }
    else {
        $('.mask_phone').mask('(00) 0000-00000');
    }
});

$('.mask_cpf').mask('999.999.999-99');

$(".mask_cnpj").mask("99.999.999/9999-99");

$(".mask_cep").mask("99999-999");

$(".mask_money").maskMoney({prefix:'R$ ',decimal: ",", thousands: "."});
//}
//------------End mask-----------

function value_to_string(value){
    return value.toLocaleString("pt-BR",{ style: "currency" , currency:"BRL"})
}

// function string_to_value(value){
//     return +parseFloat(value.replace(/[^0-9\,]/g,'').replace(',','.')).toFixed(2)
// }

function set_mask(class_mask, value){
    $(class_mask).maskMoney({
        prefix:'R$ ',
        decimal: ",", 
        thousands: ".",
    }).maskMoney('mask', value);
}