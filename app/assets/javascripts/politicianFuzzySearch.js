var showList = new List('legislator-list', {
  valueNames: ['name'],
  plugins: [ListFuzzySearch()]
});

$("#legislator-list-panel").on( "click", ".legislator-pic", function() {
  if ($(this).siblings().attr('checked')) {
    $(this).css('outline', 'none');
    $(this).siblings().removeAttr('checked');
  } else {
    $(this).css('outline', '5px solid #A9BC64');
    $(this).siblings().attr('checked', 'checked');
  }
});