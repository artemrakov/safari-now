if (window.location.pathname !== '/safaris') {
(function($){
  $(function(){
    var scroll = $(document).scrollTop();
    var headerHeight = $('.navbar-wagon').outerHeight();

    $(window).scroll(function() {
      var scrolled = $(document).scrollTop();
      if (scrolled > headerHeight){
        $('.navbar-wagon').addClass('off-canvas');
      } else {
        $('.navbar-wagon').removeClass('off-canvas');
      }

        if (scrolled > scroll){
         $('.navbar-wagon').removeClass('fixed');
        } else {
        $('.navbar-wagon').addClass('fixed');
        }
      scroll = $(document).scrollTop();
     });

   });
})(jQuery);}
