$(document).ready(function(){
  var legislator_count = $(".legislator_amount").length
  var $legislator_amounts = $(".legislator_amount")
  var $total_amount = $("#donation_amount")
  var $sliderBlocks = $('div[data-legislator-id]')


  var addEventListeners = function(){
    $('[data-slider]').on('change.fndtn.slider', updateAmountsAndSliders);
  }

  var removeEventListeners = function(){
    $('[data-slider]').off('change.fndtn.slider', updateAmountsAndSliders);
  }

  var setSliders = function(){
    removeEventListeners();
    var total_amount = $total_amount.val();
    var eachPercentage = 100 / ($sliderBlocks.length)
    $legislator_amounts.text((total_amount/legislator_count).toFixed(2))
    $sliderBlocks.each(function(){
      $('.range-slider', this).foundation('slider', 'set_value', eachPercentage);
      $('.range-slider', this).addClass('active');
    })
    addEventListeners();
  };

  $("#donation_amount").on("keyup", setSliders);

  var updateAmountsAndSliders = function(event){
    var total_amount = $total_amount.val();

    var target_current_amount = $('span', $(event.target).closest('.legislator_slider_block')).text();
    var target_current_percentage = (target_current_amount/total_amount)*100.00;

    var target_new_percentage = event.target.dataset.slider;
    var target_new_amount = total_amount * (target_new_percentage/100);
    if(isNaN(target_new_amount)){
      alert("total_amount: "+total_amount+", target_new_percentage: "+target_new_percentage)
    }
console.log(target_new_amount);
    var target_percentage_diff = target_current_percentage - target_new_percentage;
    // console.log('out',target_percentage_diff)
    // var friend_perct_diff = target_percentage_diff / legislator_count - 1;
    $(event.target).closest('.legislator_slider_block').children().first().children('span').text(target_new_amount);

    // $('.range-slider').each(function(){
    //   var friend_current_percentage = this.dataset.slider;
    //   if(friend_current_percentage < 0.01 && friend_perct_diff < 0.01){
    //     $(this).removeClass('active');
    //   }else if(friend_current_percentage > 99.98 && friend_perct_diff > 0){
    //     $(this).removeClass('active');
    //   }else if($(this).attr('class') === "range-slider"){
    //     $(this).addClass('active');
    //   }
    //   console.log($(this).attr('class'))
    // })

    removeEventListeners();

    if(target_percentage_diff>0){
      $('.range-slider').each(function(){
        if($(this).attr('class') === "range-slider"){
          $(this).addClass('active');
        };
      })
    }


    // var friends = $(event.target).closest('.legislator_slider_block').siblings()
    // friends.each(function(){
    //   var friend_current_percentage = $('.range-slider', this)[0].dataset.slider;
    //   if(friend_current_percentage < 0.01 && friend_perct_diff < 0.01){
    //     $('.range-slider', this).removeClass('active');
    //   }else if(friend_current_percentage > 99.98 && friend_perct_diff > 0){
    //     $('.range-slider', this).removeClass('active');
    //   }else if($('.range-slider', this).className === "range-slider"){
    //     $('.range-slider', this).addClass('active');
    //   }
    // });

    var activeFriends = $('.active');
    // console.log('length',(activeFriends.length-1));
    activeFriends.each(function(){
      var friend_current_percentage = this.dataset.slider;
      friend_perct_diff = target_percentage_diff / (activeFriends.length-1);
      var friend_new_percentage = parseFloat(friend_current_percentage) + friend_perct_diff;
      if(friend_new_percentage < 0 && friend_perct_diff < 0.01){
        $(this).removeClass('active');
        $(this).foundation('slider', 'set_value', 0);
        $('.legislator_amount', $(this).closest('.legislator_slider_block')).text(0);
      }else if(friend_new_percentage > 99.98 && friend_perct_diff > 0){
        $(this).removeClass('active');
        $(this).foundation('slider', 'set_value', 100);
        $('.legislator_amount', $(this).closest('.legislator_slider_block')).text(total_amount);
      }else{
        // console.log(friend_new_percentage);
        var friend_new_amount = total_amount * (friend_new_percentage/(100));
        // console.log(friend_new_percentage);
        $(this).foundation('slider', 'set_value', friend_new_percentage);

        $('.legislator_amount', $(this).closest('.legislator_slider_block')).text(friend_new_amount);

      }

    })

    addEventListeners();
  }

})