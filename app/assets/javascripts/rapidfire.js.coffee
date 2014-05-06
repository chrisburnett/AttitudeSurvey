# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
        $('.category-button').on 'click', (event) ->
                all_off()
                color = $(this).css('border-color')
                $(this).css('background', color)
                $(this).css('color', '#FFFFFF')
                category_id = $(this).find('div').attr('id').split('-')[1];
                $('input[id^="survey_response_card_placement"][id$="card_id"][value=' + card_id + ']').next('input').val(category_id);

        $('form').on 'ajax:success', (event, data, status, xhr) ->
                $('#question-section').replaceWith((event) -> $('#results-section').show())

all_off = ->
        $('.category-button').css('background', 'none')
        $('.category-button').css('color', '#2D3E4F')
        
                        
        
$(document).ready(ready)
$(document).on('page:load', ready)
