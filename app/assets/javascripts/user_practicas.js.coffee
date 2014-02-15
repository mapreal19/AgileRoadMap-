jQuery ->
  
  # TextArea se modifica conforme se escribes
  App.autosizeTextArea = autosizeTextArea = () ->
    $('textarea.comment').autosize()
    
  App.toggleTablaObjetivos = toggleTablaObjetivos = () ->
    $('#toggle_objetivos').click ->
      $('#tabla_objetivos').toggle 'slow'
      App.resetFilasTablaPracs()

  App.noMargenCheckBox = noMargenCheckBox = () ->
    $("#no_margen").change ->
      if @checked
        $(".no-margen").fadeOut "slow"
      else
        $(".no-margen").fadeIn "slow"

  App.noAplicableCheckBox = noAplicableCheckBox = () ->
    $("#no_aplicable").change ->
      console.log 'changed checkbox no_aplicable'
      if @checked
        $(".no-aplicable").fadeOut "slow"
      else
        $(".no-aplicable").fadeIn "slow"


  App.updateAplicableCheckBox = updateAplicableCheckBox = () ->
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
  App.updateRange = updateRange = () ->
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
      if (range_new == "0" and $('#no_margen').is(':checked'))
        fila_practica.fadeOut "slow", ->
          fila_practica.addClass("no-margen")
      else if range_new == "0"
        fila_practica.addClass("no-margen")
      else
        fila_practica.removeClass("no-margen")

      $.ajax(
        type: 'POST'
        url: $('table#sortable').data('range-url')
        dataType: 'json'
        data: { id: item_id, user_practica: { range: range_new } }
        )

  # Actualiza los comentarios mediante AJAX
  App.updateComment = updateComment = () ->
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
  App.objetivoClick = objetivoClick = () ->
    valoresContribucion = {1: 'Muy Baja', 2: 'Baja', 3: 'Media', 4: 'Alta', 5: 'Muy Alta'}

    $(".ver-practica").click ->
      $this = $(this)
      ids = $this.parent().parent().data('ids')
      
      App.resetFilasTablaPracs()

      # Mostramos ojo tachado y ocultamos ojo.
      $this.find('.objetivo-eye-close').toggle()
      $this.find('.objetivo-eye-open').toggle()

      if $this.find('.objetivo-eye-close').css('display') == 'none'
        # Desactivamos
        $this.parent().parent().removeClass('active')
        return
      else
        $this.parent().parent().addClass('active')
        
        # id[0] -> practica_id 
        # id[1] -> valor de contribución
        for id in ids
          $('tr[data-practica-id="' + id[0] + '"]').addClass("success")
          $('tr[data-practica-id="' + id[0] + '"]').append('<td class="contribucion">' + valoresContribucion[id[1]] + '</td')

        $('table#sortable thead tr').append('<th class="col-sm-1 col-xs-1 valor-contribucion">Contribución del objetivo</th>')

        $("html, body").animate
          scrollTop: $("#mapa").offset().top
        , 2000

  # Helper functions
  
  App.resetFilasTablaPracs = () ->
    $('.practica').removeClass("success")
    $('.contribucion').remove()
    $('.valor-contribucion').remove()
      

###$('#post_title').change(function() {
  // Do your stuff, instantiate variables, etc...
  $.ajax({
    type: post_or_get,
    url: your_url,
    data: your_data,
    success: function(data) {
      // Handle stuff after hitting the server here
    },
    error: function(data) {
    }
  });
});###
