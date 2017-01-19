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

  $("#hamburger-menu i, #hamburger-menu a").click(function() {
    $("#hamburger-menu, #backdrop").toggleClass("active");
  });

  $(document).one("focus.expand", "textarea.expand", function() {
    var savedValue = this.value;
    this.value = "";
    this.baseScrollHeight = this.scrollHeight;
    this.value = savedValue;
  }).on("input.expand", "textarea.expand", function() {
    var minRows = this.dataset.minRows | 0;
    var rows = void 0;
    this.rows = minRows;
    if (this.baseScrollHeight == undefined) {
      $(this).trigger("focus");
    }
    rows = Math.ceil((this.scrollHeight - this.baseScrollHeight) / 18);
    this.rows = minRows + rows;
  });

  $("form").on("submit", function() {
    $("form")[0].reset();
    $("#notice").toggleClass("active");
  });
}, false);
