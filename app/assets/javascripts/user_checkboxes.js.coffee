App.page_init = ->
#https://github.com/igor-alexandrov/wiselinks/issues/41

	cbLocalStorage('checkbox-margen', '#no_margen', '.no-margen')
	cbLocalStorage('checkbox-aplicable', '#no_aplicable', '.no-aplicable')
	

cbLocalStorage = (itemStorage, idCheckBox, classRows) -> 
	cbChecked = localStorage.getItem(itemStorage)

	$(idCheckBox).prop('checked', cbChecked) 

	if cbChecked == 'true'
		cbChecked = true
	else
		cbChecked = false

	$(idCheckBox).prop('checked', cbChecked) 

	if cbChecked
		$(classRows).hide()

	$(idCheckBox).change ->
		if @checked
			localStorage.setItem(itemStorage, true)
		else
			localStorage.setItem(itemStorage, false)





