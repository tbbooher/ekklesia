$(document).ready(function(){
  $('.donations').on("click", getUserDonations);
  $('.stances').on("click", getUserStances);
});

function getUserDonations(event) {
  event.preventDefault();
  var $target = $(event.target);
  $.ajax({
    url: $target.attr("href"),
    type: "GET"
  }).done(function(resonse){
    console.log(resonse);
    $('.user-table').html(resonse);
  });
}