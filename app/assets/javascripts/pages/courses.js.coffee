jQuery ->
  if $('.pagination').length
          $(window).scroll ->
                  url = $('.pagination .next_page').attr('href')
                  if url &&  $(window).scrollTop() > $(document).height() - $(window).height() - 500
                          $('.pagination').text('Fetching more courses...')
                          $.getScript(url)
    $(window).scroll()