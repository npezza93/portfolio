const $ = require('jquery');
import { MDCTabScroller } from '@material/tab-scroller';

window.addEventListener('load', function() {
  new MDCTabScroller(document.querySelector('.mdc-tab-scroller'))
})

$(document).on('click', '.slide', function() {
  if (document.querySelector('.content.active')) {
    return
  }

  const project = this.dataset.for
  const content = document.querySelector(`[data-project=${project}`)

  let bounds = this.getBoundingClientRect()
  content.style.position = "fixed"
  content.style.top = bounds.top.toString() + "px"
  content.style.left = bounds.left.toString() + "px"
  content.classList.remove("invisible")
  content.classList.add('active')
  content.querySelector(".img").classList.remove("invisible")
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
  let content = this.parentElement
  const project = content.dataset.project
  const slide = document.querySelector(`[data-for=${project}`)

  let logoContainer = slide.querySelector(".img")
  let bounds = logoContainer.getBoundingClientRect()

  content.style.height = bounds.height.toString() + "px"
  content.style.width = bounds.width.toString() + "px"
  content.style.overflowY = 'hidden'
  content.classList.add('fade-out')

  $(content).animate({
    "left": bounds.left.toString() + "px",
    "top": bounds.top.toString() + "px",
  }, 400, function() {
    content.classList.remove('active')
    $(content).removeAttr('style')
    document.querySelector('body').style['overflow-y'] = 'scroll'
    content.classList.remove('fade-out')
    content.classList.add('open-transition')
    content.classList.remove('close-transition')
    content.classList.add('invisible')
  })
});

$(document).on('click', '#hamburger', function() {
  $('#hamburger-menu, #backdrop').toggleClass('active')
})

$(document).on('click', '#hamburger-menu svg, #hamburger-menu a', function() {
  $('#hamburger-menu, #backdrop').toggleClass('active')
})

$(document).one('focus.expand', 'textarea.expand', function() {
  var savedValue = this.value;
  this.value = '';
  this.baseScrollHeight = this.scrollHeight;
  this.value = savedValue;
}).on('input.expand', 'textarea.expand', function() {
  var minRows = this.dataset.minRows | 0;
  var rows = void 0;
  this.rows = minRows;
  if (this.baseScrollHeight == undefined) {
    $(this).trigger('focus');
  }
  rows = Math.ceil((this.scrollHeight - this.baseScrollHeight) / 18);
  this.rows = minRows + rows;
});
