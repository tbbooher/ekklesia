$(document).ready(function(){
  $('#more-info').on("click", toggleAdditionalLegislators);
  $('.donation').on("click", denyDonation);
  $('.button_to').on("submit", emailThankYou);
})

function toggleAdditionalLegislators() {

  var $arrow = $('#arrow')

  if ($arrow.data('toggle') == "off") {
     $('#arrow').html("&#65516");
     $('.row.legislator').toggle()
     $arrow.data('toggle', "on");
  } else {
    $('#arrow').html("&#65515");
    $('.row.legislator').toggle()
    $arrow.data('toggle', "off");
  }
}

function denyDonation(event) {
  event.preventDefault();
}

function emailThankYou(event){
  event.preventDefault();
  var $target = $(event.target);

  $.ajax({
    url: $target.attr('action'),
    type: "POST"
  }).done(function(response){
    $('.donation-email-panel').replaceWith(response);
  });
}