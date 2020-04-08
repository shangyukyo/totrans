#= require jquery.min
#= require bootstrap.min
#= require own-menu
#= require owl.carousel.min
#= require main

$(document).ready ->
  $('select[name=locale]').change ->
    $this = $(this)
    $.ajax
      type: 'post'
      url: '/set_locale'
      data: { locale: $this.val() }
      dataType: 'json'
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
      success: (rsp) ->        
        window.location.reload()
