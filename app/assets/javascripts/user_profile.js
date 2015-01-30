// $(document).ready(function(){
//   $('.donations').on("click", getUserDonations);
//   $('.stances').on("click", getUserStances);
// });

// function getUserDonations(event) {
//   event.preventDefault();
//   console.log("donations");
//   var $target = $(event.target);
//   debugger
//   $.ajax({
//     url: $target.attr("href"),
//     type: "GET"
//   }).done(function(resonse){
//     console.log(resonse);
//     $('.user-table').html(resonse);
//   });
// }

// function getUserStances(event) {
//   event.preventDefault();
//   console.log("stances");
//   $.ajax({}).done(function(){});
// }