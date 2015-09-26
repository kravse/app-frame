Main = (()->

  init = () -> 
    $(window).on 'hashchange', onHashChange
    onHashChange()

    $(document).on 'click', '.burger', (e) ->
      e.preventDefault()
      $('#route-wrapper').addClass('show-side-nav')

    $(document).on 'click', '.color-changer', ->
      $(this).parent().css('background-color', getRandomColor())
    $(document).on 'click', '.close, .side-menu-item', () ->
      $('.show-side-nav').removeClass('show-side-nav')

    $('.listing-img').each (index, element) => 

      $(element).css('background-color', getRandomColor())

  onHashChange = () ->
    hash = window.location.hash.replace('#', '')
    router(hash)

  router = (hash) ->
    switch (hash)
      when "home"
        $('#route-wrapper').attr('class', 'show-home')
      when "list-item"
        $('#route-wrapper').attr('class', 'show-list-item')
      when "my-items"
        $('#route-wrapper').attr('class', 'show-my-items')
      when "feed"
        $('#route-wrapper').attr('class', 'show-feed')
      when "search"
        $('#route-wrapper').attr('class', 'show-search')
      when "profile"
        $('#route-wrapper').attr('class', 'show-profile')
      when "settings"
        $('#route-wrapper').attr('class', 'show-settings')
      when "single-item"
        $('#route-wrapper').attr('class', 'show-single-item')
      
      else
        console.log 'nothing'

  getRandomColor = ->
    console.log 'yo'
    letters = '0123456789ABCDEF'.split('')
    color = '#'
    i = 0
    while i < 6
      color += letters[Math.floor(Math.random() * 16)]
      i++
    color

  return {
    init: init,
    onHashChange: onHashChange, 
    router: router
  }
  
)()