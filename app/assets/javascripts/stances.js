$(document).ready(function(){
  $('.side-nav').on("click", "a", updateStanceView);
  $('#donation_amount').on('keyup', distribute)
  $('.each_amount').on('keyup', updateTotal)
})

var distribute = function(event){
    var totalAmount = $(event.target).val()
    var amount = totalAmount / $('.each_amount').length
    $('.each_amount').val(amount)
};

var updateTotal = function(event){
    var total = 0
    $('.each_amount').each(function(){
        if(parseInt($(this).val()) > 0){
            total += parseInt($(this).val())
        }
    })
    $('#donation_amount').val(total)
};

var updateStanceView = function(event){
  event.preventDefault();
  $target = $(event.target);
  $.ajax({
    url: $target.attr('href'),
    type: "GET",
    data: {select: $target.text()}
  }).done(function(response){
    $('.stances').replaceWith(response);
  });
};