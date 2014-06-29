App.updateCommentObjetivo = ->
  $(".objetivo-comment").blur ->
    $this = $(this)
    item_id = $this.parent().parent().data('item-id')
    comment_new = $this.val()
    $.ajax(
      type: 'POST'
      url: $('table#tabla_objetivos').data('update-rest')
      dataType: 'json'
      data: { id: item_id, user_objetivo: { comment: comment_new } }
      )

App.updateNoInteresaCheckbox = ->
	$(".no-interesa-checkbox").change ->
      $this = $(this)
      fila_objetivo = $this.parent().parent()
      objetivo_id = fila_objetivo.data('item-id')

      if (@checked and $('#no_interesa').is(':checked'))
        fila_objetivo.fadeOut "slow", ->
          fila_objetivo.addClass("no-interesa")
      else if @checked
        fila_objetivo.addClass("no-interesa")
      else
        fila_objetivo.removeClass("no-interesa")
      
      $.ajax(
        type: 'POST'
        url: $('table#tabla_objetivos').data('interesa-url')
        dataType: 'json'
        data: { id: objetivo_id, user_objetivo: { no_interesa: @checked}}
        )

App.noInteresaCheckBox = ->
  $("#no_interesa").change ->
    if @checked
      $(".no-interesa").fadeOut "slow"
    else
      $(".no-interesa").fadeIn "slow"


