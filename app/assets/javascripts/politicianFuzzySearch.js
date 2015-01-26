var showList = new List('legislator-list', {
  valueNames: ['name'],
  plugins: [ListFuzzySearch()]
});

$("#legislator-list-panel").on( "click", ".legislator-pic", function() {
  if ($(this).siblings().attr('checked')) {
    $(this).css('border', 'none');
    $(this).siblings().removeAttr('checked');
  } else {
    $(this).css('border', '5px solid #008CBA');
    $(this).siblings().attr('checked', 'checked');
  }
});