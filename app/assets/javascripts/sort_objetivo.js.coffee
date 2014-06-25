jQuery ->

  App.sort_objetivo = ->
  
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
    )