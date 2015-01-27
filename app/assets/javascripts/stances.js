$('.side-nav').on("click", "a", function(event){
  event.preventDefault();
  $target = $(event.target);
  $.ajax({
    url: $target.attr('href'),
    type: "GET",
    data: {select: $target.text()}
  }).done(function(response){
    $('.small-block-grid-3').replaceWith(response);
  });
});