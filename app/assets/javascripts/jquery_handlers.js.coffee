$(document).ajaxSuccess(() ->
  toastr.success("Saved")
)

$(document).ajaxError((request) ->
  errorMessage = "changes didn't save in the server"
  title = "Error processing request"

  toastr.error(errorMessage, title)
)
