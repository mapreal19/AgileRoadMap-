jQuery ->
	App.autosizeTextArea = autosizeTextArea = () ->
		$('textarea.comment').autosize()

	App.updateRange = updateRange = () ->
		$(".range").change ->
			# p.parent().parent().data('item-id')
			# p.val()
			$this = $(this)
			item_id = $this.parent().parent().data('item-id')
			range_new = $this.val()

			$.ajax(
				type: 'POST'
				url: $('table#sortable').data('range-url')
				dataType: 'json'
				data: { id: item_id, user_practica: { range: range_new } }
				)
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

	App.objetivoClick = objetivoClick = () ->
		#foo.data('ids')
		$(".objetivo").click ->
			$this = $(this)
			ids = $this.data('ids')
			$('.practica').removeClass("success")
			$('.contribucion').remove()
			
			# id[0] -> practica_id 
			# id[1] -> valor de contribución
			console.log(ids)
			for id in ids
				$('tr[data-practica-id="' + id[0] + '"]').addClass("success")
				$('tr[data-practica-id="' + id[0] + '"]').append('<td class="contribucion">' + id[1] + '</td')

			$("html, body").animate
  			scrollTop: $("#mapa").offset().top
			, 2000

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
