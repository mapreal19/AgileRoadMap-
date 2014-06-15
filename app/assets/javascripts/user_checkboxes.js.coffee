App.page_init = ->
	$("#no_margen").prop('checked', localStorage.getItem('checkbox-margen')) 

	$("#no_margen").change -> 
		#https://github.com/igor-alexandrov/wiselinks/issues/41

		console.log('no margen')
		if @checked
			localStorage.setItem('checkbox-margen', true)
		else
			localStorage.setItem('checkbox-margen', false)




