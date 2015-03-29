

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
returnVal[0] = "Voters"

var bill_fiscal = 0
$.ajax({
  method: "GET",
  url:"/ajax"
}).done(function(response) {
  var voters = JSON.parse(response.bill_voters)
  for (i=1; i < (voters.length+1); i++) {
    returnVal[i] = voters[i-1].fiscal_mean
  }
})

return returnVal;
}

function getBillVotesSocialScores(){

//stub to get bill Fiscal (y Axis) data Ruby Objects
var returnVal = []
//by convention first element is name of series
returnVal[0] = "Voters_x"

var bill_social = 0
$.ajax({
  method: "GET",
  url:"/ajax"
}).done(function(response) {
  var voters = JSON.parse(response.bill_voters)
  for (i=1; i < (voters.length+1); i++) {
    returnVal.push(voters[i-1].social_mean)
  }
})
return returnVal;
}




var chart = c3.generate({
    data: {
        xs: {
            Users: 'Users_x',
            Bills: 'Bills_x',
            VotersYes: 'VotersYes_x',
            VotersNo: 'VotersNo_x'
        },
        // iris data from R
        columns: [
            ['Users_x',0.15],
            ['Users',0.4],
            ['Bills_x',0.4],
            ['Bills',0.3],
            ['VotersYes_x',0.1, 0.2, 0.25, 0.3, 0.12, 0.2, 0.4, 0.1,0.1, 0.2, 0.25, 0.3, 0.12, 0.2, 0.4],
            ['VotersYes',0.1, 0.2, 0.25, 0.3, 0.12, 0.2, 0.4, 0.1,0.2, 0.25, 0.3, 0.12, 0.2, 0.4, 0.1],
            ['VotersNo_x',-0.1, -0.2, -0.25, -0.3, -0.12, -0.2, -0.4, -0.1,-0.1, -0.2, -0.25, -0.3, -0.12, -0.2, -0.4],
            ['VotersNo',-0.1, -0.2, -0.25, -0.3, -0.12, -0.2, -0.4, -0.1,-0.2, -0.25, -0.3, -0.12, -0.2, -0.4, -0.1],
        ],
        colors: {
          Users: 'green',
          Bills: 'red',
          VotersYes: 'blue',
          VotersNo: 'orange'
        },

        // columns: [
        //     getUserSocialScores(),
        //     getBillSocialScores(),
        //     getUserFiscalScores(),
        //     getBillFiscalScores(),
        //     getBillVotesFiscalScores(),
        //     getBillVotesSocialScores(),
        // ],
        type: 'scatter'
    },
    point:
    {r: 9},
    axis: {
        x: {
            show: true,
      label: 'Social',
            min: -1,
            max:1,
            tick: {
                fit: false
            }
        },
        y: {
      show: true,
            label: 'Fiscal',
            min: -1,
            max:1
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