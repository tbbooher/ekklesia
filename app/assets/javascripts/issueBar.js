// (function() {
//   if ($(".issue-bar") !== []) {
//     var issueBarWidth = $(".issue-bar").width()
//     var issueBarLeft = $(".issue-bar").offset().left
//     var issueBarRight = issueBarWidth + issueBarLeft

//     var pics = $(".issue-bar-pic")
//     for (var i = 0; i < pics.length; i++) {
//       var position = ($(pics[i]).data("value") / 100) * issueBarWidth - 15
//       $(pics[i]).css('margin-left', position)
//     }

//   }
// }());