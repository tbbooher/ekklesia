Stripe.setPublishableKey('pk_test_8fpSl3Vt6x5LvZ6DD0yeFO24');

$(document).ready(function() {
    $('.donate-form').submit(function(e) {
        var $form = $(this);

        $form.find('button').prop('disabled', true);
        Stripe.card.createToken($form, stripeResponseHandler);
        return false;
    });
});

var stripeResponseHandler = function(status, response) {
    var $form = $('.donate-form');

    if (response.error) {
        $form.find('.donate-errors').text(response.error.message);
        $form.find('button').prop('disabled', false);
    } else {
        var token = response.id;
        $form.append($('<input type="hidden" name="stripeToken" />').val(token));
        $form.get(0).submit();
    }
};
