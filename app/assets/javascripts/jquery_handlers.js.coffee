$(document).ajaxSuccess(() ->
  toastr.success(I18n.t("ajax.success"))
)

$(document).ajaxError(() ->
  toastr.error(I18n.t("ajax.error_message"), I18n.t("ajax.error_title"))
)
