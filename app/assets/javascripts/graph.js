

function getUserSocialScores(){
//stub to get user Social (x Axis) data from Ruby Objects
var returnVal = []
//by convention first element is name of series
returnVal[0] = "Users_x"
var user_social = 0
$.ajax({
  method: "GET",
  url:"/ajax"
}).done(function(response) {
  returnVal[1] = JSON.parse(response.user).social_mean
})
return returnVal;
}

function getUserFiscalScores(){
//stub to get user Fiscal (y Axis) data Ruby Objects
var returnVal = []
//by convention first element is name of series
returnVal[0] = "Users"
var user_fiscal = 0
$.ajax({
  method: "GET",
  url:"/ajax"
}).done(function(response) {
  returnVal[1] = JSON.parse(response.user).fiscal_mean
})


return returnVal;
}

function getBillSocialScores(){
//stub to get bill Social (x Axis) data Ruby Objects
var returnVal = []
//by convention first element is name of series
returnVal[0] = "Bills_x"
var bill_social = 0
$.ajax({
  method: "GET",
  url:"/ajax"
}).done(function(response) {
  returnVal[1] = JSON.parse(response.bill).social_mean
})

return returnVal;
}


function getBillFiscalScores(){
//stub to get bill Fiscal (y Axis) data Ruby Objects
var returnVal = []
//by convention first element is name of series
returnVal[0] = "Bills"

var bill_fiscal = 0
$.ajax({
  method: "GET",
  url:"/ajax"
}).done(function(response) {
  returnVal[1] = JSON.parse(response.bill).fiscal_mean
})

return returnVal;
}

function getBillVotesFiscalScores(){
//stub to get bill Fiscal (y Axis) data Ruby Objects
var returnVal = []
//by convention first element is name of series
returnVal[0] = "Bills"

var bill_fiscal = 0
$.ajax({
  method: "GET",
  url:"/ajax"
}).done(function(response) {
  var voters = JSON.parse(response.bill_voters)
  for (var i=0; i < voters.count)
})

return returnVal;
}




var chart = c3.generate({
    data: {
        xs: {
            Users: 'Users_x',
            Bills: 'Bills_x',
        },
        // iris data from R
        columns: [
            getUserSocialScores(),
            getBillSocialScores(),
            getUserFiscalScores(),
            getBillFiscalScores(),
        ],
        type: 'scatter'
    },
    axis: {
        x: {
            show: true,
      label: 'Social',
            tick: {
                fit: false
            }
        },
        y: {
      show: true,
            label: 'Fiscal'
        }
    },

  grid: {
  x: {
  lines: [
      {value: 0}
    ]
  },
  y: {
    lines: [
      {value: 0}
    ]
  }
}

});