(($) ->
  'use strict'
  # Start of use strict
  # Smooth scrolling using jQuery easing
  $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click ->
    if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
      target = $(@hash)
      target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
      if target.length
        $('html, body').animate { scrollTop: target.offset().top - 57 }, 1000, 'easeInOutExpo'
        return false
    return
  # Closes responsive menu when a scroll trigger link is clicked
  $('.js-scroll-trigger').click ->
    $('.navbar-collapse').collapse 'hide'
    return
  # Activate scrollspy to add active class to navbar items on scroll
  $('body').scrollspy
    target: '#mainNav'
    offset: 57
  # Collapse Navbar

  navbarCollapse = ->
    if $('#mainNav').offset().top > 100
      $('#mainNav').addClass 'navbar-shrink'
    else
      $('#mainNav').removeClass 'navbar-shrink'
    return

  # Collapse now if page is not at top
  $(document).on 'turbolinks:load', navbarCollapse
  # Collapse the navbar when page is scrolled
  $(window).scroll navbarCollapse
  # Scroll reveal calls
  window.sr = ScrollReveal()
  sr.reveal '.sr-icons', {
    duration: 600
    scale: 0.3
    distance: '0px'
  }, 200
  sr.reveal '.sr-button',
    duration: 1000
    delay: 200
  sr.reveal '.sr-contact', {
    duration: 600
    scale: 0.3
    distance: '0px'
  }, 300
  # Magnific popup calls
  # $('.popup-gallery').magnificPopup
  #   delegate: 'a'
  #   type: 'image'
  #   tLoading: 'Loading image #%curr%...'
  #   mainClass: 'mfp-img-mobile'
  #   gallery:
  #     enabled: true
  #     navigateByImgClick: true
  #     preload: [
  #       0
  #       1
  #     ]
  #   image: tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
  return
) jQuery
# End of use strict
