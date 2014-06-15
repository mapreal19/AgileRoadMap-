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
#= require jquery.ui.sortable
#= require jquery.ui.effect-highlight
#= require jquery.ui.touch-punch
#= require jquery.autosize
#= require jquery.simulate.drag-sortable
#= require wiselinks
#= require nprogress
#= require_tree .

$(document).ready ->
    window.wiselinks = new Wiselinks('.content')

    #---INITIALIZATION Unify scripts
    App.init()
    App.initSliders()
    Index.initParallaxSlider()

    $(document).off('page:loading').on(
      'page:loading'
      (event, $target, render, url) ->
        # console.log("Loading: #{url} to #{$target.selector} within '#{render}'")
        # code to start loading animation
        NProgress.start()
    )

    $(document).off('page:redirected').on(
      'page:redirected'
      (event, $target, render, url) ->
        # console.log("Redirected to: #{url}")
        # code to start loading animation
        NProgress.start()
    )

    $(document).off('page:always').on(
      'page:always'
      (event, xhr, settings) ->
        # console.log("Wiselinks page loading completed")
        # code to stop loading animation
        NProgress.done()
    )


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

