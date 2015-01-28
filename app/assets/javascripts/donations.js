$(document).ready(function(){
  $('#more-info').on("click", toggleAdditionalLegislators)
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
