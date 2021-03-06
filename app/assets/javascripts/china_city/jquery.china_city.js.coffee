(($) ->
  $.fn.china_city = () ->
    @each ->
      selects = $(@).find('.city-select')
      selects.change ->
        next_select = selects.eq(selects.index(@) + 1)
        if !$(@).val() # empty all children city
          $("option:gt(0)", next_select).remove()
          next_select.change()
        else if next_select[0] # init next child
          $.get "/china_city/#{$(@).val()}", (data) ->
            $("option:gt(0)", next_select).remove()
            next_select[0].options.add(new Option(option[0], option[1])) for option in data

  $ ->
    $('.city-group').china_city()
)(jQuery)
