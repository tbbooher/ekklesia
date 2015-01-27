$(document).ready(function(){
  $('.side-nav').on("click", "a", updateStanceView);
  $('#total_amount').on('keyup', distribute)
  $('.each_amount').on('keyup', updateTotal)
  $('.new_upvote').on('submit', updateVoteCount)
})

var distribute = function(event){
  var totalAmount = $(event.target).val()
  var amount = totalAmount / $('.each_amount').length
  $('.each_amount').val(amount.toFixed(2))
};

var updateTotal = function(event){
  var total = 0
  $('.each_amount').each(function(){
      if(parseInt($(this).val()) > 0){
          total += parseInt($(this).val())
      }
  })
  $('#total_amount').val(total.toFixed(2))
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

var updateVoteCount = function(event){
  event.preventDefault();
  $target = $(event.target);
  $.ajax({
    url: $target.attr('action'),
    type: $target.attr('method'),
    data: {stance_id: $target.children('#upvote_stance_id').val()}
  }).done(function(response){
    $('#upvote_count').text(response)
    $('.upvote_button').val("Voted")
  });
}