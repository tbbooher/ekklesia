$(document).ready(function(){
  $('.side-nav').on("click", "a", updateStanceView);
  $('#total_amount').on('keyup', distribute)
  $('.each_amount').on('keyup', updateTotal)
  $('.new_upvote').on('submit', updateVoteCount)
  $('.issue_select').on('click', getPositions)
  $('.position_select_box').on('click', 'li',highlightPositon)
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


var getPositions = function(){
  event.preventDefault();
  $target = $(event.target);
  $.ajax({
    url: $target.attr('href'),
    type: 'get',
    data: {issue_id: $target.attr('value')}
  }).done(function(response){
    $('.position_select_box').children('ul').replaceWith(response)
  });
}

var highlightPositon = function(){
  if ($(this).children('.legislator-checkbox').attr('checked')) {
    $(this).css('outline', 'none');
    $(this).children('.legislator-checkbox').removeAttr('checked');
  } else {
    $('li', $(this).parent()).each(function(){
      $(this).children('.legislator-checkbox').removeAttr('checked');
      $(this).css('outline', 'none');
    })
    $(this).css('outline', '5px solid #A9BC64');
    $(this).children('.legislator-checkbox').attr('checked', 'checked');
  }
}