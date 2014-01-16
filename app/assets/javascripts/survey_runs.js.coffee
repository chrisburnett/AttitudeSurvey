# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
        $('.card-assignment-pie').each (index, element) ->
                data = $(element)
                        .parent()
                        .parent()
                        .find($('.card-assignment-data'))
                        .data('proportions')
                context = $(element).get(0).getContext('2d')
                new Chart(context).Doughnut(data)

        timingsChart = $('#response-timings-chart')
        context = timingsChart.get(0).getContext('2d')
        data = $('#response-timings-data').data('timings')
        new Chart(context).Line(data)
        
$(document).ready(ready)
$(document).on('page:load', ready)
