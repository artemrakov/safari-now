$("#inpt_search").on('focus', function () {
  $(this).parent('label').addClass('active');
});

$("#inpt_search").on('blur', function () {
  if($(this).val().length == 0)
    $(this).parent('label').removeClass('active');
});

$("#inpt_search").on('mouseenter', function () {
  $(this).attr('placeholder', 'e.g. Kenya');
});

$("#inpt_search").on('mouseleave', function () {
  $(this).attr('placeholder', '');
});
