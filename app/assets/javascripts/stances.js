$(document).ready(function() {
  $('.side-nav').on("click", "a", updateStanceList);
  $('#total_amount').on('keyup', distribute)
  $('.each_amount').on('keyup', updateTotal)
  $('.new_upvote').on('submit', updateVoteCount)
  $(".stance_detail_list").on('click', "a[data-method='post']", updateVoteCountFromIndex)
  $('.issue_select').on('click', getPositions)
  $('.position_select_box').on('click', 'li', highlightPositon)
  $(".legislator-select").on("click", selectLegislator)
  $('#load_more_button').on('click', loadMoreStances)
})

var distribute = function(event) {
  var totalAmount = $(event.target).val()
  var amount = totalAmount / $('.each_amount').length
  $('.each_amount').val(amount.toFixed(2))
};

var updateTotal = function(event) {
  var total = 0
  $('.each_amount').each(function() {
    if (parseInt($(this).val()) > 0) {
      total += parseInt($(this).val())
    }
  })
  $('#total_amount').val(total.toFixed(2))
};

var updateStanceList = function(event) {
  event.preventDefault();
  $target = $(event.target);
  $.ajax({
    url: $target.attr('href'),
    type: "GET",
    data: {select: $target.text(), i: 0}
  }).done(function(response){
    $('.stance_detail_list').empty();
    $('.stance_detail_list').append(response);
    $('span', '.stance_index_title').text($target.text());
  });
};

var loadMoreStances = function(event) {
  event.preventDefault();
  $target = $(event.target);
  $.ajax({
    url: $target.attr('action'),
    type: $target.attr('method'),
    data: {
      i: $('.stance_detail').length,
      select: $('span', '.stance_index_title').text()
    }
  }).done(function(response) {
    $('.stance_detail_list').append(response)
  });
}

var updateVoteCountFromIndex = function(event) {
  event.preventDefault();
  $target = $(event.target).closest('a');
  $.ajax({
    url: $target.attr('href'),
    type: $target.attr('data-method'),
    data: {
      id: $target.attr('id')
    }
  }).done(function(response) {
    $target.siblings().children('.upvotecount').text(response)

  });
}

var updateVoteCount = function(event) {
  event.preventDefault();
  $target = $(event.target);
  var s_id = $target.attr('id');
  $.ajax({
    url: $target.attr('action'),
    type: $target.attr('method'),
    data: {
      id: $target.children('#upvote_stance_id').val()
    }
  }).done(function(response) {
    $('#upvote_count').text(response)
    $("input[type='submit']",'#'+s_id).attr('value', 'Voted')
    $("input[type='submit']",'#'+s_id).attr('disabled', 'true')
  });
}


var getPositions = function(event) {
  event.preventDefault();
  $target = $(event.target);
  $.ajax({
    url: $target.attr('href'),
    type: 'get',
    data: {
      issue_id: $target.attr('value')
    }
  }).done(function(response) {
    $('.position_select_box').children('ul').replaceWith(response)
  });
}


var highlightPositon = function() {
  if ($(this).children('.legislator-checkbox').attr('checked')) {
    $(this).css('outline', 'none');
    $(this).children('.legislator-checkbox').removeAttr('checked');
  } else {
    $('li', $(this).parent()).each(function() {
      $(this).children('.legislator-checkbox').removeAttr('checked');
      $(this).css('outline', 'none');
    })
    $(this).css('outline', '5px solid #A9BC64');
    $(this).children('.legislator-checkbox').attr('checked', 'checked');
  }
}


var selectLegislator = function() {
  if ($(this).children('.legislator-checkbox').attr('checked')) {
    $(this).css('outline', 'none');
    $(this).children('.legislator-checkbox').removeAttr('checked');
  } else {
    $(this).css('outline', '5px solid #A9BC64');
    $(this).children('.legislator-checkbox').attr('checked', 'checked');
  }
};