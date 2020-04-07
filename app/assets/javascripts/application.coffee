#= require rails-ujs
#= require activestorage
#= require turbolinks
#= require_tree .

$(document).ready ->
  $('a.set-locale').click ->
    $this = $(this)
    $.ajax
      type: 'post'
      url: '/set_locale'
      data: { locale: $this.attr('locale') }
      dataType: 'json'
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
      success: (rsp) ->        
        window.location.reload()
