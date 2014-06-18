App.updateNoInteresaCheckbox = ->
	$(".no-interesa-checkbox").change ->
      $this = $(this)
      fila_objetivo = $this.parent().parent()
      objetivo_id = fila_objetivo.data('item-id')

      ###if (@checked and $('#no_aplicable').is(':checked'))
        fila_practica.fadeOut "slow", ->
          fila_practica.addClass("no-aplicable")
      else if @checked
        fila_practica.addClass("no-aplicable")
      else
        fila_practica.removeClass("no-aplicable")###
      
      $.ajax(
        type: 'POST'
        url: $('table#tabla_objetivos').data('interesa-url')
        dataType: 'json'
        data: { id: objetivo_id, user_objetivo: { no_interesa: @checked}}
        )



