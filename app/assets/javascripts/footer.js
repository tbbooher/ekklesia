$(document).ready(function() {

  var footer = $(".footer");
  var pos = footer.position();
  var height = $(this).height();
  height = height - pos.top;
  height = height - footer.height();
  if (height > 0) {
    footer.css({
      'margin-top': height + 'px'
    });
  }
});
