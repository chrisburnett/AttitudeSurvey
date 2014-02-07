ready = ->
        $("#consent").on 'click', (event) ->
                update_button()
        $("#resident").on 'click', (event) ->
                update_button()
                
update_button = ->
        if $("#consent").prop("checked") and $("#resident").prop("checked")
                $("#begin-button").toggleClass('disabled', false)
        else
                $("#begin-button").toggleClass('disabled', true)
                
$(document).ready(ready)
$(document).on('page:load', ready)
