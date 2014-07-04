jQuery ->
  
  # TextArea se modifica conforme se escribes
  App.autosizeTextArea = ->
    $('textarea.comment').autosize()
    
  App.toggleTablaObjetivos = ->
    $('#toggle_objetivos').click ->
      $('#checkbox_objetivo').toggle 'slow'
      $('#tabla_objetivos').toggle 'slow'
      App.resetFilasTablaPracs()

      # Mostar/Ocular ojo
      $('#toggle_objetivos i').toggle()

      # Reset Tabla Objetivos
      $('.objetivo-eye-close').hide()
      $('.objetivo-eye-open').show()
      $('#tabla_objetivos tr.active').removeClass('active')


  App.noMargenCheckBox = ->
    $("#no_margen").change ->
      if @checked
        $(".no-margen").fadeOut "slow"
      else
        $(".no-margen").fadeIn "slow"

  App.noAplicableCheckBox = ->
    $("#no_aplicable").change ->
      if @checked
        $(".no-aplicable").fadeOut "slow"
      else
        $(".no-aplicable").fadeIn "slow"


  App.updateAplicableCheckBox = ->
    $(".no-aplicable-checkbox").change ->
      $this = $(this)
      fila_practica = $this.parent().parent()
      item_id = fila_practica.data('item-id')

      if (@checked and $('#no_aplicable').is(':checked'))
        fila_practica.fadeOut "slow", ->
          fila_practica.addClass("no-aplicable")
      else if @checked
        fila_practica.addClass("no-aplicable")
      else
        fila_practica.removeClass("no-aplicable")
      
      $.ajax(
        type: 'POST'
        url: $('table#sortable').data('aplicable-url')
        dataType: 'json'
        data: { id: item_id, user_practica: { no_aplicable: @checked}}
        )

  # Actualiza el maregen de aplicación vía AJAX
  App.updateRange = ->
    $(".range").change ->
      # p.parent().parent().data('item-id')
      # p.val()
      $this = $(this)
      fila_practica = $this.parent().parent()
      item_id = fila_practica.data('item-id')
      range_new = $this.val()

      # Si no se define margen añadir warning
      if range_new >= 0
        $this.removeClass("amarillo")
        #fila_practica.removeClass("warning")
      else
        $this.addClass "amarillo"
        #fila_practica.addClass("warning")

      # Si el rango es ninguno y el checkbox está activado
      if (range_new == "4" and $('#no_margen').is(':checked'))
        fila_practica.fadeOut "slow", ->
          fila_practica.addClass("no-margen")
      else if range_new == "4"
        fila_practica.addClass("no-margen")
      else
        fila_practica.removeClass("no-margen")

      $.ajax(
        type: 'POST'
        url: $('table#sortable').data('range-url')
        dataType: 'json'
        data: { id: item_id, user_practica: { range: range_new } }
        )

  App.updateEffort = ->
    $(".effort").change ->
      $this = $(this)
      fila_practica = $this.parent().parent()
      item_id = fila_practica.data('item-id')
      effort_new = $this.val()

      $.ajax(
        type: 'POST'
        url: $('table#sortable').data('update-rest')
        dataType: 'json'
        data: { id: item_id, user_practica: { effort: effort_new } }
        )

  # Actualiza los comentarios mediante AJAX
  App.updateComment = ->
    # blur: when the element loses its focus
    $(".comment").blur ->
      $this = $(this)
      item_id = $this.parent().parent().data('item-id')
      comment_new = $this.val()
      $.ajax(
        type: 'POST'
        url: $('table#sortable').data('comment-url')
        dataType: 'json'
        data: { id: item_id, user_practica: { comment: comment_new } }
        )

  # Muestra las prácticas relacionadas con el objetivo seleccionado
  App.objetivoClick = ->
    valoresContribucion = {1: 'Muy Baja', 2: 'Baja', 3: 'Media', 4: 'Alta', 5: 'Muy Alta'}

    $(".ver-practica").click ->
      $this = $(this)
      ids = $this.parent().parent().data('ids')

      # Desmarcar objetivos si el ojo abierto esta oculto
      if $this.find('.objetivo-eye-open').css('display') == 'none'
        App.resetFilasTablaPracs()
        App.resetFilasRelPracs()
        App.resetTablaObjetivos()
        return

      # Reset
      App.resetFilasTablaPracs()
      App.resetFilasRelPracs()

      # Reset tabla objetivos
      App.resetTablaObjetivos()
     
      # Mostramos ojo tachado y ocultamos ojo.
      $this.find('.objetivo-eye-close').toggle()
      $this.find('.objetivo-eye-open').toggle()

      $this.parent().parent().addClass('active')

      # id[0] -> practica_id
      # id[1] -> valor de contribución
      for id in ids
        $('tr[data-practica-id="' + id[0] + '"]').addClass("success")
        $('tr[data-practica-id="' + id[0] + '"]').append('<td class="contribucion">' + valoresContribucion[id[1]] + '</td')

      $('table#sortable thead tr').append('<th class="col-sm-1 col-xs-1 valor-contribucion">Contribución al objetivo</th>')

      $("html, body").animate
        scrollTop: $("#mapa").offset().top
      , 2000

  # Muestra las prácticas relacionadas entre sí
  App.practicaClick = ->

    $(".ver-practicas-relacionadas").click (e) ->
      $this = $(this)
      ids = $this.parent().parent().data('pracs-ids')
      
      # Reset color filas
      # Si ojo esta abierto: Lo cerramos y abrimos el que esté cerrado. REFACTOR
      if $this.find('.practica-eye-close').css('display') == 'none'
        App.resetFilasRelPracs()

      App.resetFilasTablaPracs()
      App.resetTablaObjetivos()


      # Mostramos ojo tachado y ocultamos ojo.
      $this.find('.practica-eye-close').toggle()
      $this.find('.practica-eye-open').toggle()


      if $this.find('.practica-eye-close').css('display') == 'none'
        # Desactivamos
        $this.parent().parent().removeClass('active')
        $('.practica').removeClass('resaltado')
      else
        $this.parent().parent().addClass('active')
        
        for id in ids
          $('tr[data-practica-id="' + id + '"]').addClass("resaltado")

      e.preventDefault()

  # Helper functions
  App.resetFilasTablaPracs = () ->
    $('.practica').removeClass("success")
    $('.contribucion').remove()
    $('.valor-contribucion').remove()

  App.resetFilasRelPracs = () ->
    $('.practica.active .practica-eye-close').hide()
    $('.practica.active .practica-eye-open').show()
    $('.practica').removeClass("resaltado active")

  App.resetTablaObjetivos = () ->
    $('.objetivo.active .objetivo-eye-close').hide()
    $('.objetivo.active .objetivo-eye-open').show()
    $('.objetivo').removeClass("active")
