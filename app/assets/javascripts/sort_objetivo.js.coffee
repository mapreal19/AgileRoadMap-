jQuery ->

  # this is a small hack; when a tr is dragged with jQuery UI sortable
  # the cells lose their width
  App.sort = sort = () ->
    # console.log ($($('.table').find('tr')[0].cells[0]).css('width'))
    ###cells = $('.table').find('tr')[0].cells.length 
    desired_width = 940 / cells + 'px'
    $('.table td').css('width', desired_width)###
    ###
    $('.table').find('tr')[0].cells[0]
    $(p).css('width')
    ###
    updateRowIndex = ->
      filas = $('.item-objetivo')
      for fila in filas
        $fila = $(fila)
        new_index = $fila.index() + 1 # Para empezar desde el 1 y no el 0
        $(fila).find('td.orden').first().text(new_index)

    $('#tabla_objetivos').sortable(
      axis: 'y'
      items: '.item-objetivo'

      handle: ".handle"

      # highlight the row on drop to indicate an update
      stop: (e, ui) ->
        ui.item.children('td').effect('highlight', {}, 1000)
      update: (e, ui) ->
        item_id = ui.item.data('item-id')
        position = ui.item.index()

        $.ajax(
          type: 'POST'
          url: $(this).data('update-url')
          dataType: 'json'

          # the :thing hash gets passed to @thing.attributes
          # row_order is the default column name expected in ranked-model
          data: { id: item_id, user_objetivo: { row_order_position: position } }
        )
        updateRowIndex()        
    )