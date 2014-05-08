# this class is similar to the survey response controller, in that it
# creates a survey response, but it doesn't follow the full pathway of
# the whole survey (consent, all cards, all recipients) but rather
# shows a random card or recipient and asks to
class RapidfireController < ApplicationController

  # display the new page
  def new
    @survey = Survey.active_survey
    @survey_response = SurveyRun.active_survey_run.survey_responses.build
    @card = @survey.cards.all.sample
    @sensitivity_question = false
    # randomly choose a question type
    if rand < 0.5
      # create a placement object for the card we got
      @survey_response.card_placements.build(card_id: @card.id)
      @sensitivity_question = true
    else
      # for a sharing question, we need a recipient and a card
      @recipient = @survey.recipients.all.sample
      @survey_response.sharing_prefs.build(card_id: @card.id, recipient_id: @recipient.id)
    end
  end
  # no need for create method - automatically goes to surveyresponse
  # handler because of the form_for method

  # no need for edit/update/delete - each rapidfire response will be
  # saved as a new surveyresponse - very simple loop

end
