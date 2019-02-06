$(document).ajaxError((event, request) ->
  if(request.readyState == 0)
    toastr.error(I18n.t("ajax.error_network"), I18n.t("ajax.error_title"))
  else
    toastr.error(I18n.t("ajax.error_message"), I18n.t("ajax.error_title"))
)
