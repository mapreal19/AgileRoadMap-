# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require jquery.autosize
#= require jquery.simulate.drag-sortable
#= require toastr
#= require i18n/translations
#= require_tree .

$(document).ready ->
  # INITIALIZATION Unify scripts
  App.init()
  App.initSliders()
  Index.initParallaxSlider()

  $(document).off('page:done').on(
    'page:done'
    (event, $target, status, url, data) ->
      App.init()
      App.initSliders()
      Index.initParallaxSlider()
      # Initialize the navbar dropdown
      $('[data-hover="dropdown"]').dropdownHover()

      # Google analytics
      if $('RAILS_ENV').text() == 'production'
        _gaq.push(['_trackPageview', url])
  )

