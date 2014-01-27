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
			for id in ids
				$('tr[data-practica-id="' + id + '"]').addClass("success")
				$("html, body").animate
  				scrollTop: $("#mapa").offset().top
				, 2000
				#alert id

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
