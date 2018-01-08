$(document).on('click', '.slide', function() {
  if (document.querySelector('.content.active')) {
    return
  }

  content = this.querySelector('.content')
  logoContainer = this.querySelector(".invisible.img")

  bounds = logoContainer.getBoundingClientRect()
  content.style.position = "fixed"
  content.style.top = bounds.top.toString() + "px"
  content.style.left = bounds.left.toString() + "px"
  content.classList.add('active')
  document.querySelector('body').style['overflow-y'] = 'hidden'
  $(content).animate(
    { "left": 0, "top": 0 },
    400,
    function() {
      content.classList.remove('open-transition')
      content.classList.add('close-transition')
      content.style.overflowY = 'scroll'
    }
  )
});

$(document).on('click', '.close-project-desc', function() {
  slide = this.parentElement.parentElement
  logoContainer = slide.querySelector(".invisible.img")
  content = slide.querySelector(".content")
  bounds = logoContainer.getBoundingClientRect()

  content.style.height = bounds.height.toString() + "px"
  content.style.width = bounds.width.toString() + "px"
  content.style.overflowY = 'hidden'
  content.classList.add('fade-out')

  $(content).animate({
    "left": bounds.left.toString() + "px",
    "top": bounds.top.toString() + "px",
  }, 400, function() {
    content.querySelector('.img').classList.remove('active')
    content.classList.remove('active')
    $(content).removeAttr('style')
    document.querySelector('body').style['overflow-y'] = 'scroll'
    content.classList.remove('fade-out')
    content.classList.add('open-transition')
    content.classList.remove('close-transition')
  })
});

document.addEventListener('DOMContentLoaded', function() {
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
