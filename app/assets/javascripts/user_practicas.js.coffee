jQuery ->
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
