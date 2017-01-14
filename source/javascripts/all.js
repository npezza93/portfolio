document.addEventListener('DOMContentLoaded', function() {
  var mySwiper = new Swiper('.swiper-container', {
      speed: 400,
      spaceBetween: 50,
      slidesPerView: 'auto'
  });

  $(".learn-more").click(function() {
    return $(this).parent().find(".img").toggleClass("active");
  });

  $("#hamburger").click(function() {
    $("#hamburger-menu, #backdrop").toggleClass("active");
  });
  $("#hamburger-menu i").click(function() {
    $("#hamburger-menu, #backdrop").toggleClass("active");
  });
}, false);
