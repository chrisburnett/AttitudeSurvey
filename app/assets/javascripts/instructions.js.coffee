ready = ->
        $("#consent").on 'click', (event) ->
                if this.checked
                        $("#begin-button").toggleClass('disabled', false)
                else
                        $("#begin-button").toggleClass('disabled', true)
$(document).ready(ready)
$(document).on('page:load', ready)
